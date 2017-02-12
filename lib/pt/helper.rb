module PT
  module Helper

    GLOBAL_CONFIG_PATH = ENV['HOME'] + "/.pt"
    LOCAL_CONFIG_PATH = Dir.pwd + '/.pt'
    ACTION = %w[show open start finish deliver accept reject done assign estimate tasks comment label ]

    def load_global_config

      # skip global config if env vars are set
      if ENV['PIVOTAL_EMAIL'] and ENV['PIVOTAL_API_KEY']
        config = {
          :email => ENV['PIVOTAL_EMAIL'],
          :api_number => ENV['PIVOTAL_API_KEY']
        }
        return config
      end

      config = YAML.load(File.read(GLOBAL_CONFIG_PATH)) rescue {}
      if config.empty?
        message "I can't find info about your Pivotal Tracker account in #{GLOBAL_CONFIG_PATH}."
        while !config[:api_number] do
          config[:api_number] = ask "What is your token?"
        end
        congrats "Thanks!",
          "Your API id is " + config[:api_number],
          "I'm saving it in #{GLOBAL_CONFIG_PATH} so you don't have to log in again."
        save_config(config, GLOBAL_CONFIG_PATH)
      end
      config
    end

    def get_local_config_path
      # If the local config path does not exist, check to see if we're in a git repo
      # And if so, try the top level of the checkout
      if (!File.exist?(LOCAL_CONFIG_PATH) && system('git rev-parse 2> /dev/null'))
        return `git rev-parse --show-toplevel`.chomp() + '/.pt'
      else
        return LOCAL_CONFIG_PATH
      end
    end

    def load_local_config
      check_local_config_path
      config = YAML.load(File.read(get_local_config_path())) rescue {}


      if ENV['PIVOTAL_PROJECT_ID']

        config[:project_id] = ENV['PIVOTAL_PROJECT_ID']

        @client = Client.new(@global_config[:api_number])
        project = @client.get_project(config[:project_id])
        config[:project_name] = project.name

        membership = @client.get_my_info
        config[:user_name], config[:user_id], config[:user_initials] = membership.name, membership.id, membership.initials
        save_config(config, get_local_config_path())

      end

      if config.empty?
        message "I can't find info about this project in #{get_local_config_path()}"
        @client = Client.new(@global_config[:api_number])
        projects = ProjectTable.new(@client.get_projects)
        project = select("Please select the project for the current directory", projects)
        config[:project_id], config[:project_name] = project.id, project.name
        project = @client.get_project(project.id)
        membership = @client.get_my_info
        config[:user_name], config[:user_id], config[:user_initials] = membership.name, membership.id, membership.initials
        congrats "Thanks! I'm saving this project's info",
          "in #{get_local_config_path()}: remember to .gitignore it!"
        save_config(config, get_local_config_path())
      end
      config
    end

    def check_local_config_path
      if GLOBAL_CONFIG_PATH == get_local_config_path()
        error("Please execute .pt inside your project directory and not in your home.")
        exit
      end
    end

    def save_config(config, path)
      File.new(path, 'w') unless File.exists?(path)
      File.open(path, 'w') {|f| f.write(config.to_yaml) }
    end

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
      @io.ask(msg)
    end

    def ask_secret(msg)
      @io.ask("#{msg.bold}"){ |q| q.echo = '*' }
    end

    def user_s
      "#{@local_config[:user_name]} (#{@local_config[:user_initials]})"
    end

    def project_to_s
      "Project #{@local_config[:project_name].upcase}"
    end

    def task_type_or_nil query
      if (["feature", "bug", "chore"].index query)
        return query
      end
      nil
    end

    def task_by_id_or_pt_id id
      if id < 1000
        tasks = @client.get_my_work(@local_config[:user_name])
        table = TasksTable.new(tasks)
        table[id]
      else
        @client.get_task_by_id id
      end
    end

    def find_task query
      members = @client.get_members
      members.each do | member |
        if member.name.downcase.index query
          return member.name
        end
      end
      nil
    end

    def find_owner query
      if query
        member = @client.get_member(query)
        return member ? member.person : nil
      end
      nil
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
      unless (@local_config[:recent_tasks])
        @local_config[:recent_tasks] = Array.new();
      end
      @local_config[:recent_tasks].unshift( task_id )
      @local_config[:recent_tasks] = @local_config[:recent_tasks].uniq()
      if @local_config[:recent_tasks].length > 10
        @local_config[:recent_tasks].pop()
      end
      save_config( @local_config, get_local_config_path() )
    end

    def select(msg, table)
      if table.length > 0
        begin
          table.print @global_config
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
        table.print @global_config
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
            create_interactive_story(requested_by_id: @local_config[:user_id])
          elsif story == 'EOF' || story == 'r'
            page = old_page
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

