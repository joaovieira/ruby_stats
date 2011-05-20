require 'metric_fu'

class MetricFu::Stats
  def emit
    code_dirs = File.join(MetricFu.base_directory, '..')
    `cd #{code_dirs} && rake stats > #{metric_directory + '/stats.txt'}`
  end
end
