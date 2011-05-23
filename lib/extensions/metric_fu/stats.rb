require 'metric_fu'

class MetricFu::Stats

	def emit
	  project_dir = File.join(MetricFu.base_directory, '..')
      `cd #{project_dir} && rake stats > #{metric_directory + '/stats.txt'}`
    end
	
end