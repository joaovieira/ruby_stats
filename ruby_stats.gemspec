# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ruby_stats/version"

Gem::Specification.new do |s|
  s.name = "ruby_stats"
  s.version = RubyStats::VERSION
  s.platform = Gem::Platform::RUBY
  s.email = "ei07128@fe.up.pt"
  s.homepage    = "http://github.com/joaovieira/ruby_stats.git"
  s.summary = "Ruby file statistics analyzer engine."
  s.description = "Ruby file statistics analyzer engine with grapher support."
  s.authors = ['Ana Castro', 'Bruno Duarte', 'Jo�o Vieira','Jos� Miguel Viana', 'Oleksandr Kruk', 'Pedro Oliveira', 'Ricardo Ferreira']
  
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = Dir['Rakefile', '{app,lib,config,test,public}/**/*', 'README*']
  s.require_paths = ["lib"]

  s.add_dependency "metric_fu", ">= 2.1.1"
end

