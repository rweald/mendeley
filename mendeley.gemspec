# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mendeley/version"

Gem::Specification.new do |s|
  s.name        = "mendeley"
  s.version     = Mendeley::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ryan Weald"]
  s.email       = ["ryan@weald.com"]
  s.homepage    = "http://isurfsoftware.com"
  s.summary     = %q{"A simple ruby wrapper for the mendeley api"}
  s.description = %q{"Currently supports the public documents api for search and detailed view"}

  s.rubyforge_project = "mendeley"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'mocha'
  s.add_dependency 'rest-client'
  s.add_dependency 'yajl-ruby'
end
