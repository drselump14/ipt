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
    include PT::Helper
    attr_reader :project

    def initialize(*args)
      super
      @io = HighLine.new
      @global_config = load_global_config
      @local_config = load_local_config
      @client = Client.new(@global_config[:api_number], @local_config)
      @project = @client.project
    end

    %w[unscheduled started finished delivered accepted rejected].each do |state|
      desc "#{state} <owner>", "show all #{state} stories"
      define_method(state.to_sym) do  |owner = nil|
        filter =  "state:#{state}"
        filter << " owner:#{owner}" if owner
        story = select_story_from_paginated_table do |page|
          @client.get_stories(filter: filter, page: page)
        end
        show_story(story)
      end
    end

    ACTION.each do |action|
      desc "#{action} [id]", "#{action} story"
      define_method(action.to_sym) do |story_id = nil|
        if story_id
          story = task_by_id_or_pt_id(story_id.to_i)
          unless story
            message("No matches found for '#{story_id}', please use a valid pivotal story Id")
            return
          end
        else
          method_name = "get_stories_to_#{action}"
          story = select_story_from_paginated_table do |page|
            if @client.respond_to?(method_name.to_sym)
              @client.send("get_stories_to_#{action}", page: page)
            else
              @client.get_stories(page: page)
            end
          end
        end
        title("#{action} '#{story.name}'")
        send("#{action}_story", story)
      end
    end

    desc 'mywork', 'list all your stories'
    def mywork
      story = select_story_from_paginated_table do |page|
        @client.get_stories(filter: "owner:#{@local_config[:user_name]} -state:accepted", page: page)
      end
    end

    desc "list [owner]", "list all stories from owner"
    def list(owner = nil)
      if owner
        if owner == "all"
          stories = @client.get_work
          TasksTable.new(stories).print @global_config
        else
          stories = @client.get_my_work(owner)
          TasksTable.new(stories).print @global_config
        end
      else
        members = @client.get_members
        table = MembersTable.new(members)
        user = select("Please select a member to see his tasks.", table).name
        title("Work for #{user} in #{project_to_s}")
        stories = @client.get_my_work(user)
        TasksTable.new(stories).print @global_config
      end
    end

    desc "recent", "show stories you've recently shown or commented on with pt"
    def recent
      title("Your recent stories from #{project_to_s}")
      stories = @project.stories( ids: @local_config[:recent_tasks].join(',') )
      MultiUserTasksTable.new(stories).print @global_config
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
          requested_by_id: @local_config[:user_id],
          owner_ids: [owner_id],
          description: description
        }
        params[:story_type] = options[:type] if options[:type]

        story = @client.create_story(params)
        congrats("Story has been created \n #{story.url}")
      else
        create_interactive_story(requested_by_id: @local_config[:user_id])
      end
    end

    desc "find [query] " ,"looks in your stories by title and presents it"
    def find(query)
      story = select_story_from_paginated_table do |page|
        @client.get_stories(filter: query, page: page)
      end
      show_story(story)
    end

    desc "updates","shows number recent activity from your current project"
    def updates
      activities = @client.get_activities
      tasks = @client.get_my_work
      title("Recent Activity on #{project_to_s}")
      activities.each do |activity|
        show_activity(activity, tasks)
      end
    end
  end
end
