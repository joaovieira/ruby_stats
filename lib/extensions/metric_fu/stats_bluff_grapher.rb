require 'metric_fu'
require 'ruby_stats'

class MetricFu::StatsBluffGrapher
  def graph!
    if File.basename(MetricFu.output_directory) == RubyStats::ANALYSER.underscore
      content = <<-EOS
        var g = new Bluff.Line('#{RubyStats::NAME}', '550x330');
        g.theme_pastel();
        g.tooltips = true;
        g.data('LOC', [#{@loc_counts.join(',')}]);
        g.data('LOT', [#{@lot_counts.join(',')}]);
        g.labels = #{@labels.to_json};
        g.draw();
      EOS

      File.open(File.join(MetricFu.output_directory, 'stats.js'), 'w') {|f| f << content }
    end
  end
end
