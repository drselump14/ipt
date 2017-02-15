require 'highline'
module PT
  module IO

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

    def clear
      puts "\e[H\e[2J"
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
          elsif %w[n p q c r f].include?(row)
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
        current_page = @client.current_page
        total_page = @client.total_page
        title = (options[:title] || 'Stories').to_s + " [#{current_page}/#{total_page}]"
        table = TasksTable.new(stories, title)
        clear
        say "Pivotal Tracker Command Line v#{PT::VERSION}".magenta
        say '========================================================================================='.green
        help = "[num]: select | [f]ilter | #{'[n]ext |' if current_page < total_page} #{'[p]revious |' if current_page > 1} [c]reate | [r]efresh | [q]uit"
        say help.green
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
          elsif story == 'f'
            choose_filter
          elsif story == 'EOF'
            HighLine.new.choose do |menu|
              menu.prompt = "Please choose action ( [number/name]:select action)".magenta
              menu.choice(:filter) { choose_filter }
              menu.choice(:back) { say('back to table ....'); page-=1 }
              menu.choice(:quit) { quit }
              menu.default = :quit
            end
          elsif story == 'r'
            page = old_page
          end
          no_request = false
        else
          error "Invalid selection, try again:"
          no_request = true
        end
      end while true
    end

    def choose_action(story)
      HighLine.new.choose do |menu|
        menu.prompt = "Please choose action ( [number/name]:select action | [Enter]:show story )".magenta
        menu.choice(:view, 'view details of story','view') { show_story(story) }
        menu.choice(:edit, nil,'edit story') { edit_story(story) }
        menu.choice(:start, nil,'start'.white) { start_story(story) }
        menu.choice(:finish, nil,'finish'.blue) { finish_story(story) }
        menu.choice(:deliver, nil,'deliver'.yellow) { deliver_story(story) }
        menu.choice(:accept, nil,'accept'.green) { accept_story(story) }
        menu.choice(:reject, nil,'reject'.red) { reject_story(story) }
        %w[unstart assign estimate tasks comment label open].each do |action|
          menu.choice(action.to_sym) { send("#{action}_story", story) }
        end
        menu.choice('id (copy story id)') { copy_story_id(story)}
        menu.choice('url (copy story url)') { copy_story_url(story) }
        menu.choice(:back) { say('back to table ....'); return :no_request }
        menu.choice(:quit) { quit }
        menu.default = :view
      end
    end

    def choose_filter
      HighLine.new.choose do |menu|
        menu.prompt = "Please choose filter ( [number/name]:select filter | [Enter]:back to table)".magenta
        %w[current backlog mywork bug feature unstarted started finished delivered accepted rejected].each do |f|
          menu.choice(f.to_sym) do
            say 'filtering ' + f
            send(f.to_sym)
          end
        end
        menu.choice(:search) { find }
        menu.choice(:cancel) { say('back to table ....'); return :no_request }
        menu.choice(:quit) { quit }
        menu.default = :back
      end
    end
  end
end

