# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pt/version'

Gem::Specification.new do |spec|
  spec.name              = "ipt"
  spec.version           = PT::VERSION
  spec.authors           = ["Slamet Kristanto"]
  spec.email             = ["cakmet14@gmail.com"]
  spec.licenses          = ['MIT']
  spec.homepage          = "http://www.github.com/drselump14/ipt"
  spec.summary           = "Interactive Pivotal Tracker CLI (API v5)"
  spec.description       = "Interactive Pivotal Tracker Command Line Interface"
  spec.executables       = ["ipt"]

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'aruba'
  spec.add_development_dependency 'vcr'

  spec.add_dependency    'highline', '>= 2.0.0.pre.develop.6'
  spec.add_dependency    'tracker_api', '~> 1.6.0'
  spec.add_dependency    'thor'
  spec.add_dependency    'terminal-table'
  spec.add_dependency    'paint'
end
