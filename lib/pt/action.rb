module PT
  module Action
    def show_story(story)
      clear
      title('========================================='.red)
      title story.name.red
      title('========================================='.red)
      estimation = [-1, nil].include?(story.estimate) ? "Unestimated" : "#{story.estimate} points"
      requester = story.requested_by ? story.requested_by.initials : Settings[:user_name]
      message "#{story.current_state.capitalize} #{story.story_type} | #{estimation} | Req: #{requester} | Owners: #{story.owners.map(&:initials).join(',')} | ID: #{story.id}"

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
    end

    def assign_story story
      owner = choose_person
      @client.assign_story(story, owner)
      congrats("story assigned to #{owner.initials}, thanks!")
    end

    def comment_story(story)
      comment = ask("Write your comment")
      if @client.comment_task(story, comment)
        congrats("Comment sent, thanks!")
        save_recent_task( story.id )
      else
        error("Ummm, something went wrong.")
      end
    end

    def label_story(story)
      label = ask("Which label?")
      @client.add_label(story, label );
      congrats("#{label} added, thanks!")
    end

    def estimate_story(story)
      estimation ||= ask("How many points you estimate for it? (#{project.point_scale})")
      @client.estimate_story(story, estimation)
      congrats("Task estimated, thanks!")
    end

    def start_story story
      unless story.estimate
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
      type = case ask('Type? (c)hore, (b)ug, anything else for feature)')
             when 'c', 'chore'
               'chore'
             when 'b', 'bug'
               'bug'
             else
               'feature'
             end

      description = edit_using_editor if ask('Do you want to write description now?(y/n)') == 'y'
      story = @client.create_story(
        name: title,
        owner_ids: [owner_id],
        requested_by_id: Settings[:user_id],
        story_type: type,
        description: description
      )
      congrats("#{type} #{('for' + owner.name ) if owner} has been created \n #{story.url}")
      story
    end

    def edit_using_editor
      editor = ENV.fetch('EDITOR') { 'vi' }
      temp_path = "/tmp/editor-#{ Process.pid }.txt"
      system "#{ editor } #{ temp_path }"
      File.read(temp_path)
    end
  end
end

