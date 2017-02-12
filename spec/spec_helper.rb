require 'pt'
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

::Dir.glob(::File.expand_path('../support/*.rb', __FILE__)).each { |f| require_relative f }
::Dir.glob(::File.expand_path('../support/**/*.rb', __FILE__)).each { |f| require_relative f }

# default rspec config
RSpec.configure do |config|
  config.color = true
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include Aruba::Api
end

class VcrFriendlyMain
  def initialize(argv, stdin, stdout, stderr, kernel)
    @argv, @stdin, @stdout, @stderr, @kernel = argv, stdin, stdout, stderr, kernel
  end

  def execute!
    exit_code = begin
                  # Thor accesses these streams directly rather than letting them be injected, so we replace them...
                  $stderr = @stderr
                  $stdin = @stdin
                  $stdout = @stdout

                  # Run our normal Thor app the way we know and love.
                  PT::CLI.start(@argv)

                  # Thor::Base#start does not have a return value, assume success if no exception is raised.
                  0
                rescue StandardError => e
                  # The ruby interpreter would pipe this to STDERR and exit 1 in the case of an unhandled exception
                  b = e.backtrace
                  @stderr.puts("#{b.shift}: #{e.message} (#{e.class})")
                  @stderr.puts(b.map{|s| "\tfrom #{s}"}.join("\n"))
                  1
                rescue SystemExit => e
                  e.status
                ensure
                  # TODO: reset your app here, free up resources, etc.
                  # Examples:
                  # MyApp.logger.flush
                  # MyApp.logger.close
                  # MyApp.logger = nil
                  #
                  # MyApp.reset_singleton_instance_variables

                  # ...then we put the streams back.
                  $stderr = STDERR
                  $stdin = STDIN
                  $stdout = STDOUT
                end

    # Proxy our exit code back to the injected kernel.
    @kernel.exit(exit_code)
  end
end

Aruba.configure do |config|
  config.command_launcher = :in_process
  config.main_class = VcrFriendlyMain
end

