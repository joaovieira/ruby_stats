require 'ruby_stats/config'
require 'metric_fu'

module RubyStats
  class Analyser

    def self.run
      # Run metric fu!
      MetricFu.metrics.each {|metric| MetricFu.report.add(metric) }
      MetricFu.report.save_output(MetricFu.report.to_yaml, MetricFu.base_directory, "report.yml")
      MetricFu.report.save_output(MetricFu.report.to_yaml, MetricFu.data_directory, "#{Time.now.strftime("%Y%m%d")}.yml")
      MetricFu.report.save_templatized_report
    end

  end
end
