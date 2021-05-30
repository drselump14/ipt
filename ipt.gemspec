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

  spec.add_development_dependency "bundler", ">= 2.2.10"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "pry"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'aruba'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'sorbet'
  spec.add_development_dependency 'tapioca'

  spec.add_dependency 'tracker_api'
  spec.add_dependency 'thor'
  spec.add_dependency 'tty-prompt'
  spec.add_dependency 'tty-editor'
  spec.add_dependency 'tty-markdown'
  spec.add_dependency 'terminal-table'
  spec.add_dependency 'paint'
  spec.add_dependency 'anyway_config'
  spec.add_dependency 'config'
  spec.add_dependency 'zeitwerk'
  spec.add_dependency "sorbet-runtime"
end
