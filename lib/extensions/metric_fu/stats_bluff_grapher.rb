require 'metric_fu'

class MetricFu::StatsBluffGrapher
  def graph!
    if File.basename(MetricFu.output_directory) == 'ruby_stats'
      content = <<-EOS
        var g = new Bluff.Line('Statistics', '420x252');
        g.theme_pastel();
        g.tooltips = true;
        g.title_font_size = '3px';
        g.legend_font_size = '3px';
        g.marker_font_size = '3px';
        g.hide_title = 'true';
        g.data('LOC', [#{@loc_counts.join(',')}]);
        g.data('LOT', [#{@lot_counts.join(',')}]);
        g.labels = #{@labels.to_json};
        g.draw();
      EOS

      File.open(File.join(MetricFu.output_directory, 'stats.js'), 'w') {|f| f << content }
    end
  end
end
