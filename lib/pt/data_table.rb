# require 'hirb'
# require 'hirb-unicode'
require 'terminal-table'

module PT

  class DataTable

    # extend ::Hirb::Console

    def initialize(dataset, title=nil)
      @title = title
      @rows = dataset.map{ |row| DataRow.new(row, dataset) }
    end

    def print(config={})
      if @rows.empty?
        puts "\n#{'-- empty list --'.center(36)}\n"
      else

        headers = [:num]
        headers += self.class.headers.present? ? self.class.headers : self.class.fields

        fields = [:num] + self.class.fields
        rows = []
        @rows.each_with_index do |row, index|
          _row = fields.map { |f| row.send(f) }
          rows << _row
        end
        table = Terminal::Table.new(title: @title, headings: headers,
                                   rows: rows, style: { all_separators: true })
        puts table
      end
    end

    def [](pos)
      pos = pos.to_i
      (pos < 1 || pos > @rows.length) ? nil : @rows[pos-1].record
    end

    def length
      @rows.length
    end

    def self.fields
      []
    end

    def self.headers
      []
    end

  end


  class ProjectTable < DataTable

    def self.fields
      [:name]
    end

  end


  class TasksTable < DataTable

    def self.fields
      [:name, :owners, :story_type, :estimate, :state]
    end

    def self.headers
      [:title, :owners, :type, :pt, :state]
    end

  end

  class MultiUserTasksTable < DataTable

    def self.fields
      [:owned_by, :name, :state, :id]
    end

  end

  class PersonsTable < DataTable

    def self.fields
      [:initials, :name]
    end

  end

  class TodoTaskTable < DataTable

    def self.fields
      [:description]
    end
  end

  class ActionTable < DataTable

    def self.fields
      [:action]
    end
  end

end
