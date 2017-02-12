require 'aruba/rspec'
require 'vcr'
require 'faraday'

VCR.configure do |c|
  c.ignore_localhost         = true
  c.cassette_library_dir     = File.expand_path('../../vcr/cassettes', __FILE__).to_s
  c.default_cassette_options = { serialize_with: :json }
  c.hook_into :faraday
  c.allow_http_connections_when_no_cassette = true
end
