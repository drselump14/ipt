# typed: false
require 'yaml'
require 'highline'
require 'tempfile'
require 'uri'
require 'thor'
require 'paint'

# String patch monkey
class String
  %i[blue yellow green red white black magenta cyan bold].each do |color|
    define_method(color) do
      Paint[self, color]
    end
  end
end

module PT
  class CLI < Thor
    include PT::Action
    include PT::IO
    attr_reader :project

    TYPE=%w[feature bug chore release]
    ACTION = %w[show open start finish deliver accept reject done assign estimate tasks comment add_label edit unstart]

    default_task :mywork

    def initialize(*args)
      super
      @io = HighLine.new
      @config = PT::Configuration.new
      @client = @config.client || Client.new
      @project = @client.project
    end

    %w[unscheduled started finished delivered accepted rejected].each do |state|
      desc "#{state} <owner>", "show all #{state} stories"
      define_method(state.to_sym) do  |owner = nil|
        filter =  "state:#{state}"
        filter << " owner:#{owner}" if owner
        select_story_from_paginated_table(title: "#{state} stories") do |page|
          @client.get_stories(filter: filter, page: page)
        end
      end
    end

    ACTION.each do |action|
      desc "#{action} [id]", "#{action} story"
      define_method(action.to_sym) do |story_id = nil|
        if story_id
          if story = @client.project.story(story_id.to_i)
            title("#{action} '#{story.name}'")
            send("#{action}_story", story)
          else
            message("No matches found for '#{story_id}', please use a valid pivotal story Id")
            return
          end
        else
          method_name = "get_stories_to_#{action}"
          story = select_story_from_paginated_table(default_action: action, title: "Stories to #{action}") do |page|
            if @client.respond_to?(method_name.to_sym)
              @client.send("get_stories_to_#{action}", page: page)
            else
              @client.get_stories(page: page)
            end
          end
        end
      end
    end

    desc "label <label>", "filter stories by label"
    def label(_label=nil)
      _label ||= select('Please select label', LabelsTable.new(@client.project.labels)).name
      select_story_from_paginated_table(title: "stories with label:#{_label}") do |page|
        @client.get_stories(filter: "label:#{_label}", page: page)
      end
    end

    TYPE.each do |type|
      desc "#{type} <owner>", "show all #{type} stories"
      define_method(type.to_sym) do  |owner = nil|
        filter =  "story_type:#{type} -state:accepted"
        filter << " owner:#{owner}" if owner
        select_story_from_paginated_table(title: "#{type} stories") do |page|
          @client.get_stories(filter: filter, page: page)
        end
      end
    end

    desc 'mywork', 'list all your stories'
    def mywork
      select_story_from_paginated_table(title: 'My Work') do |page|
        @client.get_stories(filter: "owner:#{Settings[:user_name]} -state:accepted", page: page)
      end
    end

    %w[ current backlog ].each do |scope|
      desc "#{scope}", 'list all stories for #{scope} iteration'
      define_method(scope.to_sym) do
        select_story_from_paginated_table(title: "#{scope} iteration") do |page|
          @client.get_stories_from_iteration(scope: scope, page: page)
        end
      end
    end

    desc "list [owner]", "list all stories from owner"
    def list(owner = nil)
      owner = choose_person.initials unless owner
      select_story_from_paginated_table(title: "stories for #{owner}") do |page|
        @client.get_stories(filter: "owner:#{owner} -state:accepted", page: page)
      end
    end

    desc "recent", "show stories you've recently shown or commented on with pt"
    def recent
      title("Your recent stories from #{project_to_s}")
      select_story_from_paginated_table(title: "recent stories") do |page|
        @client.get_stories(filter: Settings[:recent_tasks].join(','), page: page)
      end
    end

    desc 'create [title] --owner <owner> --type <type> -m', "create a new story (and include description ala git commit)"
    long_desc <<-LONGDESC
      create story with title [title]

      --owner, -o  set owner

      --type , -t  set story type

      -m           enable add description using vim

      omit all parameters will start interactive mode
    LONGDESC
    option :type, aliases: :t
    option :owner, aliases: :o
    option :m, type: :boolean
    def create(title =nil)
      if title
        owner_id = if options[:owner] && (owner = @client.find_member(options[:owner]))
                     owner.person.id
                   else
                     nil
                   end
        description = edit_using_editor if options[:m]
        params = {
          name: title,
          requested_by_id: Settings[:user_id],
          owner_ids: [owner_id],
          description: description
        }
        params[:story_type] = options[:type] if options[:type]
        story = @client.create_story(params)
        congrats("Story with title #{story.name} has been created \n #{story.url}")
      else
        create_interactive_story
      end
    end

    desc "find [query] " ,"looks in your stories by title and presents it"
    long_desc <<-LONGDESC
      search using pivotal tracker search query
    LONGDESC
    def find(query=nil)
      query ||= ask("Please type seach query") { |q| q.readline = true }
      story = select_story_from_paginated_table(title: "Search result for #{query}")do |page|
        @client.get_stories(filter: query, page: page)
      end
      show_story(story)
    end

    desc 'notifications', "show notifications"
    def notifications
      NotificationsTable.new(@client.notifications).print
    end
  end
end
