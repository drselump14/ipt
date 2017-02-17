module PT
  module Action
    def show_story(story)
      clear
      title('========================================='.red)
      title story.name.red
      title('========================================='.red)
      estimation = [-1, nil].include?(story.estimate) ? "Unestimated" : "#{story.estimate} points"
      requester = story.requested_by ? story.requested_by.initials : Settings[:user_name]
      if story.instance_variable_get(:@owners).present?
        owners = story.owners.map(&:initials).join(',')
      end
      message "#{story.current_state.capitalize} #{story.story_type} | #{estimation} | Req: #{requester} | Owners: #{owners} | ID: #{story.id}"

      if story.instance_variable_get(:@labels).present?
        message "Labels: " + story.labels.map(&:name).join(', ')
      end

      message story.description.green unless story.description.nil? || story.description.empty?
      message "View on pivotal: #{story.url}"

      if story.instance_variable_get(:@tasks).present?
        title('tasks'.yellow)
        story.tasks.each{ |t| compact_message "- #{t.complete ? "[done]" : ""} #{t.description}" }
      end


      if story.instance_variable_get(:@comments).present?
        story.comments.each do |n|
          title('......................................'.blue)
          text = ">> #{n.person.initials}: #{n.text}"
          text << "[#{n.file_attachment_ids.size}F]" if n.file_attachment_ids
          message text
        end
      end
      save_recent_task( story.id )
      say ""
      title '================================================='.red
      choice = ask "Please choose action ([b]:back to table | [m]:show menu | [q] quit)"
      case choice
      when 'q'
        quit
      when 'm'
        choose_action(story)
      when 'b'
        say('back to table ....')
        return :no_request
      end
    end

    def tasks_story(story)
      story_task = get_open_story_task_from_params(story)
      if story_task.position == -1
        description = ask('Title for new task')
        story.create_task(:description => description)
        congrats("New todo task added to \"#{story.name}\"")
      else
        edit_story_task story_task
      end
    end

    def open_story story
      `open #{story.url}`
      return :no_request
    end

    def assign_story story
      owner = choose_person
      @client.assign_story(story, owner)
      congrats("story assigned to #{owner.initials}, thanks!")
    end

    def comment_story(story)
      say("Please write your comment")
      comment = edit_using_editor
      begin
        @client.comment_task(story, comment)
        congrats("Comment sent, thanks!")
        save_recent_task( story.id )
      rescue
        error("Ummm, something went wrong. Comment cancelled")
      end
    end

    def label_story(story)
      label = ask("Which label?")
      @client.add_label(story, label );
      congrats("#{label} added, thanks!")
    end

    def estimate_story(story)
      if story.story_type == 'feature'
        estimation ||= ask("How many points you estimate for it? (#{project.point_scale})")
        @client.estimate_story(story, estimation)
        congrats("Task estimated, thanks!")
      else
        error('Only feature can be estimated!')
      end
    end

    def start_story story
      if story.story_type == 'feature' && !story.estimate
        estimate_story(story)
      end
      @client.mark_task_as(story, 'started')
      congrats("story started, go for it!")
    end

    def unstart_story story
      @client.mark_task_as(story, 'unstarted')
      congrats("story unstarted")
    end

    def start_story story
      if story.story_type == 'feature' && !story.estimate
        estimate_story(story)
      end
      @client.mark_task_as(story, 'started')
      congrats("story started, go for it!")
    end

    def finish_story story
      if story.story_type == 'chore'
        @client.mark_task_as(story, 'accepted')
      else
        @client.mark_task_as(story, 'finished')
      end
      congrats("Another story bites the dust, yeah!")
    end

    def deliver_story story
      return if story.story_type == 'chore'
      @client.mark_task_as(story, 'delivered')
      congrats("story delivered, congrats!")
    end

    def accept_story story
      @client.mark_task_as(story, 'accepted')
      congrats("Accepted")
    end

    def reject_story(story)
      comment = ask("Please explain why are you rejecting the story.")
      if @client.comment_task(story, comment)
        @client.mark_task_as(story, 'rejected')
        congrats("story rejected, thanks!")
      else
        error("Ummm, something went wrong.")
      end
    end

    def done_story(story)
      start_story story

      finish_story story

      deliver_story story
    end

    def copy_story_id(story)
      `echo #{story.id} | pbcopy`
      congrats("Story ID copied")
    end

    def copy_story_url(story)
      `echo #{story.url} | pbcopy`
      congrats("Story URL copied")
    end

    def create_interactive_story
      # set title
      title = ask("Name for the new task:")

      # set owner
      if ask('Do you want to assign it now? (y/n)').downcase == 'y'
        members = @client.get_members
        table = PersonsTable.new(members.map(&:person))
        owner = select("Please select a member to assign him the task.", table)
        owner_id = owner.id
      end

      # set story type
      type = HighLine.new.choose do |menu|
        menu.prompt = 'Please set type of story:'
        menu.choice(:feature)
        menu.choice(:bug)
        menu.choice(:chore)
        menu.choice(:release)
        menu.default = :feature
      end

      description = edit_using_editor if ask('Do you want to write description now?(y/n)') == 'y'
      story = @client.create_story(
        name: title,
        owner_ids: [owner_id],
        requested_by_id: Settings[:user_id],
        story_type: type,
        description: description
      )
      congrats("#{type} #{(' for ' + owner.name ) if owner} has been created \n #{story.url}")
      story
    end

    def edit_story(story)
      # set title
      if ask("Edit title?(y/n) [#{story.name}]")  { |yn| yn.limit = 1, yn.validate = /[yn]/i } == 'y'
        say('Edit your story name')
        story.name = edit_using_editor(story.name)
      end

      # set story type
      story.story_type = case ask('Edit Type? (f)eature (c)hore, (b)ug, enter to skip)')
             when 'c', 'chore'
               'chore'
             when 'b', 'bug'
               'bug'
             when 'f', 'feature'
               'feature'
             end

      story.description = edit_using_editor(story.description) if ask('Do you want to edit description now?(y/n)') == 'y'
      story = story.save
      congrats("'#{story.name}' has been edited \n #{story.url}")
      story
    end

    def edit_story_task(task)
      action_class = Struct.new(:action, :key)

      table = ActionTable.new([
        action_class.new('Complete', :complete),
        action_class.new('Edit', :edit)
      ])
      action_to_execute = select('What to do with todo?', table)

      task.project_id = project.id
      task.client = project.client
      case action_to_execute.key
      when :complete then
        task.complete = true
        congrats('Todo task completed!')
      when :edit then
        new_description = ask('New task description')
        task.description = new_description
        congrats("Todo task changed to: \"#{task.description}\"")
      end
      task.save
    end

    def edit_using_editor(content=nil)
      editor = ENV.fetch('EDITOR') { 'vi' }
      temp_path = "/tmp/editor-#{ Process.pid }.txt"
      File.write(temp_path, content) if content
      system "#{ editor } #{ temp_path }"
      begin
        content = File.read(temp_path)
        File.delete(temp_path)
        content
      rescue
        ""
      end
    end

    def choose_person
      members = @client.get_members
      table = PersonsTable.new(members.map(&:person))
      select("Please select a member to see his tasks.", table)
    end

    def open_story_from
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

  end
end

