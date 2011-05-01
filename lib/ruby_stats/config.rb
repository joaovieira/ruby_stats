#!/usr/bin/env ruby
require 'rubygems'
require 'json'
require 'metric_fu'

projects_dir = ENV['HOME'] + '/.driller/projects/DrilleR/'

# Load default configuration
MetricFu::Configuration.run {}

# Load local configuration
MetricFu::Configuration.run do |config|
  config.base_directory = projects_dir + 'tmp/ruby_stats'
  #define which metrics you want to use
  config.metrics  = [:stats]
  config.graphs   = [:stats]
  config.code_dirs = [projects_dir+'app', projects_dir+'lib']
end


