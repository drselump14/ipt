require 'tracker_api'
require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect("pt" => "PT", "io" => "IO", "cli"=> "CLI")
loader.setup

module PT
end

loader.eager_load
