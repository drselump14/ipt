require 'config'
module PT
  class Configuration
    include PT::Helper
    GLOBAL_CONFIG_PATH = ENV['HOME'] + "/.pt.yml"
    LOCAL_CONFIG_PATH = Dir.pwd + '/.pt.yml'

    def initialize
      Config.load_and_set_settings(GLOBAL_CONFIG_PATH, get_local_config_path)
      unless (Settings[:pivotal_api_key] ||= ENV['PIVOTAL_API_KEY'])
        message "I can't find info about your Pivotal Tracker account in #{GLOBAL_CONFIG_PATH}."
        Settings[:pivotal_api_key] = ask "What is your token?"
        congrats "Thanks!",
          "Your API id is " + Settings[:pivotal_api_key],
          "I'm saving it in #{GLOBAL_CONFIG_PATH} so you don't have to log in again."
        save_config({"pivotal_api_key" => Settings[:pivotal_api_key]}, GLOBAL_CONFIG_PATH)
      end
      @client = Client.new
      Settings[:user_name] ||= @client.me.name || ENV['pivotal_user_name']
      Settings[:user_id] ||= @client.me.id || ENV['pivotal_user_id']
      Settings[:user_initials] ||= @client.me.initials || ENV['pivotal_user_initials']


      unless (Settings[:project_id] ||= ENV['PIVOTAL_PROJECT_ID'])
        projects = ProjectTable.new(@client.projects)
        project = select("Please select the project for the current directory", projects)
        Settings[:project_id], Settings[:project_name] = project.id, project.name
      end

      save_config(Settings.to_hash, get_local_config_path())
    end

    def get_local_config_path
      # If the local config path does not exist, check to see if we're in a git repo
      # And if so, try the top level of the checkout
      if (!File.exist?(LOCAL_CONFIG_PATH) && system('git rev-parse 2> /dev/null'))
        return `git rev-parse --show-toplevel`.chomp() + '/.pt.yml'
      else
        return LOCAL_CONFIG_PATH
      end
    end
    private

      def check_local_config_path
        if GLOBAL_CONFIG_PATH == get_local_config_path()
          error("Please execute .pt inside your project directory and not in your home.")
          exit
        end
      end

      def save_config(config, path)
        config = stringify(config)
        File.new(path, 'w') unless File.exists?(path)
        File.open(path, 'w') {|f| f.write(config.to_yaml) }
      end

      def stringify(hash)
        hash.inject({}) { |memo, (k,v)| memo[k.to_s] = v; memo }
      end

  end
end
