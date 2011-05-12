module RubyStats
  # This require basically states that we're going to require the engine
  # if you are using rails and your rails version is 3.x..
  require 'ruby_stats/engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
  
  # Adding a couple of extra files here and you can view all of the source
  # to see what they have in them.
  require 'templates/rstats/rstats_template'
  require 'ruby_stats/analyser'
  require 'extensions/metric_fu/stats_bluff_grapher'
end
