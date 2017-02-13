require 'highline'
module PT
  module Helper

    ACTION = %w[show open start finish deliver accept reject done assign estimate tasks comment label ]
    # I/O

    def split_lines(text)
      text.respond_to?(:join) ? text.join("\n") : text
    end

    def title(*msg)
      puts "\n#{split_lines(msg)}".bold
    end

    def congrats(*msg)
      puts "\n#{split_lines(msg).green.bold}"
    end

    def message(*msg)
      puts "\n#{split_lines(msg)}"
    end

    def compact_message(*msg)
      puts "#{split_lines(msg)}"
    end

    def error(*msg)
      puts "\n#{split_lines(msg).red.bold}"
    end

    def quit
      message "bye!"
      exit
    end

    def ask(msg)
      HighLine.new.ask(msg)
    end

    def ask_secret(msg)
      HighLine.new.ask("#{msg.bold}"){ |q| q.echo = '*' }
    end

    def user_s
      "#{Settings[:user_name]} (#{Settings[:user_initials]})"
    end

    def project_to_s
      "Project #{Settings[:project_name].upcase}"
    end

    def task_type_or_nil query
      if (["feature", "bug", "chore"].index query)
        return query
      end
      nil
    end

    def task_by_id_or_pt_id id
      if id < 1000
        tasks = @client.get_my_work(Settings[:user_name])
        table = TasksTable.new(tasks)
        table[id]
      else
        @client.get_task_by_id id
      end
    end

    def show_activity(activity, tasks)
      message("#{activity.message}")
    end

    def get_open_story_task_from_params(task)
      title "Pending tasks for '#{task.name}'"
      task_struct = Struct.new(:description, :position)

      pending_tasks = [
        task_struct.new('<< Add new task >>', -1)
      ]

      task.tasks.each{ |t| pending_tasks << t unless t.complete }
      table = TodoTaskTable.new(pending_tasks)
      select("Pick task to edit, 1 to add new task", table)
    end

    def edit_story_task(task)
      action_class = Struct.new(:action, :key)

      table = ActionTable.new([
        action_class.new('Complete', :complete),
        # action_class.new('Delete', :delete),
        action_class.new('Edit', :edit)
        # Move?
      ])
      action_to_execute = select('What to do with todo?', table)

      task.project_id = project.id
      task.client = project.client
      case action_to_execute.key
      when :complete then
        task.complete = true
        congrats('Todo task completed!')
        # when :delete then
        #   task.delete
        #   congrats('Todo task removed')
      when :edit then
        new_description = ask('New task description')
        task.description = new_description
        congrats("Todo task changed to: \"#{task.description}\"")
      end
      task.save
    end

    def clear
      puts "\e[H\e[2J"
    end

    def save_recent_task( task_id )
      # save list of recently accessed tasks
      unless (Settings[:recent_tasks])
        Settings[:recent_tasks] = Array.new();
      end
      Settings[:recent_tasks].unshift( task_id )
      Settings[:recent_tasks] = Settings[:recent_tasks].uniq()
      if Settings[:recent_tasks].length > 10
        Settings[:recent_tasks].pop()
      end
      @config.save_config( Settings, @config.get_local_config_path )
    end

    def select(msg, table)
      if table.length > 0
        begin
          table.print
          row = ask "#{msg} (1-#{table.length}, 'q' to exit)".magenta
          if row == 'q'
            quit
          elsif row.to_i > 0
            selected = table[row]
            error "Invalid selection, try again:" unless selected
          elsif %w[n p q c r].include?(row)
            return row
          end
        end until selected
        selected
      else
        table.print
        error "Sorry, there are no options to select."
        return 'EOF'
      end
    end

    def select_story_from_paginated_table(options={}, &block)
      prompt = "Please select a story"
      page = 0
      no_request = false
      begin
        say('Please wait...')
        stories = block.call(page) unless no_request
        title = (options[:title] || 'Stories').to_s + " [#{@client.current_page}/#{@client.total_page}]"
        table = TasksTable.new(stories, title)
        clear
        say "Pivotal Tracker Command Line v#{PT::VERSION}".magenta
        say '========================================================================================='.green
        say "[number]: select story | [n]:next data | [p]:previous data | [c]:create story | [r]:refresh | [q]: quit".green
        say '========================================================================================='.green
        case story = select(prompt, table)
        when TrackerApi::Resources::Story
          say "Action for >> '#{story.name.green}'[#{story.story_type}]"
          action = (options[:default_action] ? send("#{options[:default_action]}_story", story) : choose_action(story))
          no_request = action == :no_request
        when String
          if story == 'n'
            old_page = page
            page+=1
          elsif story == 'p'
            old_page = page
            page-=1
          elsif story == 'q'
            quit
          elsif story == 'c'
            create_interactive_story
          elsif story == 'EOF' || story == 'r'
            page == 0 ? quit : (page = old_page)
          end
          no_request = false
        else
          error "Invalid selection, try again:"
          no_request = true
        end
      end while true
    end

    def choose_person
      members = @client.get_members
      table = PersonsTable.new(members.map(&:person))
      select("Please select a member to see his tasks.", table)
    end

    def choose_action(story)
      HighLine.new.choose do |menu|
        menu.prompt = "Please choose action ( [number/name]:select action | [Enter]:show story )".magenta
        menu.choice(:view, 'View details of story','view') { show_story(story) }
        menu.choice(:start, nil,'start'.white) { start_story(story) }
        menu.choice(:finish, nil,'finish'.blue) { finish_story(story) }
        menu.choice(:deliver, nil,'deliver'.yellow) { deliver_story(story) }
        menu.choice(:accept, nil,'accept'.green) { accept_story(story) }
        menu.choice(:reject, nil,'reject'.red) { reject_story(story) }
        %w[assign estimate tasks comment label].each do |action|
          menu.choice(action.to_sym) { send("#{action}_story", story) }
        end
        menu.choice('id (copy story id)') { copy_story_id(story)}
        menu.choice('url (copy story url)') { copy_story_url(story) }
        menu.choice(:back) { say('back to table ....'); return :no_request }
        menu.choice(:quit) { quit }
        menu.default = :view
      end
    end
  end
end

