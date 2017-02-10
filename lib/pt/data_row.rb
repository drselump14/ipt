require 'iconv' unless "older_ruby?".respond_to?(:force_encoding)

module PT
  class DataRow

    attr_accessor :num, :record, :state, :owners

    def initialize(orig, dataset)
      @record = orig
      @num = dataset.index(orig) + 1
      if defined? orig.current_state
        @state = orig.current_state
      end

      if defined? orig.owners
        @owners = orig.owners.map(&:initials).join(',')
      end
    end

    def method_missing(method)
      str = @record.send(method).to_s
      str.respond_to?(:force_encoding) ? str.force_encoding('utf-8') : Iconv.iconv('UTF-8', 'UTF-8', str)
    end

    def to_s
      @record.send(self.to_s_attribute)
    end

    def to_s_attribute
      @n.to_s
    end

    def name
      _name = @record.name
      if _name.size > 15
        _name[0..15] + '...'
      else
        _name
      end
    end

    def state
      state = @record.current_state
      case state
      when 'delivered'
        state.yellow
      when 'finished'
        state.blue
      when 'accepted'
        state.green
      when 'rejected'
        state.red
      when 'started'
        state.white
      else
        state.black
      end
    end

    def story_type
      t = @record.story_type
      case t
      when 'bug'
        # t.red
        "🐞"
      when 'feature'
        "⭐"
      when 'release'
        '🏁'
      when 'chore'
        '⚙'
      else
        t
      end
    end

    def estimate
      @record.estimate.to_i if @record.estimate
    end

  end
end
