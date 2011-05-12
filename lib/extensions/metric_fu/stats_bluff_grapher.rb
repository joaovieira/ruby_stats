class MetricFu::StatsBluffGrapher
  def graph!
    content = <<-EOS
      var g = new Bluff.Line('Statistics', '400x240');
      g.theme_pastel();
      g.tooltips = true;
      g.title_font_size = '16px';
      g.legend_font_size = '8px';
      g.marker_font_size = '7px';
      g.hide_title = 'true';
      g.data('LOC', [#{@loc_counts.join(',')}]);
      g.data('LOT', [#{@lot_counts.join(',')}]);
      g.labels = #{@labels.to_json};
      g.draw();
    EOS

    File.open(File.join(MetricFu.output_directory, 'stats.js'), 'w') {|f| f << content }
  end
end
