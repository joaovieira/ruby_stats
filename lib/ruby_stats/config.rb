#!/usr/bin/env ruby
require 'metric_fu'
require 'templates/rstats/rstats_template'

# Load default configuration
MetricFu::Configuration.run {}

# Load local configuration
MetricFu::Configuration.run do |config|
  #define which metrics you want to use
  config.metrics  = [:stats]
  config.graphs   = [:stats]
  config.template_class = RstatsTemplate

  MetricFu::Grapher::BLUFF_GRAPH_SIZE = '400x240'
  MetricFu::Grapher::BLUFF_DEFAULT_OPTIONS = %{ 
      var g = new Bluff.Line('graph', '#{MetricFu::Grapher::BLUFF_GRAPH_SIZE}');
      g.theme_pastel();
      g.tooltips = true;
      g.title_font_size = '16px'
      g.legend_font_size = '8px'
      g.marker_font_size = '7px'
      g.hide_title = 'true'
    }
end


