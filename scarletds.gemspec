# -*- encoding: utf-8 -*-
require File.expand_path('../lib/scarletds', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'scarletds'
  s.version     = Scarletds::VERSION
  s.date        = '2012-09-04'
  s.summary     = "ScarletDS - Little Collection of Ruby Algorithms and Data Structures"
  s.description = "A collection of algorithms and data structures in ruby"
  s.authors     = ["Reza Marvan Spagnolo"]
  s.email       = 'marvans@gmail.com'
  s.homepage    = 'http://rubygems.org/gems/scarletds'

  s.files       = `git ls-files`.split($\)
  s.executables = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files  = s.files.grep(%r{^(test|spec|features)/})

  s.add_development_dependency 'rdoc'
  s.add_development_dependency 'rake','~> 0.9.2'
end
