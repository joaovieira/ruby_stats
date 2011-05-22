require 'metric_fu'

class MetricFu::Stats

    def emit
	  project_dir = File.join(MetricFu.base_directory, '..')
      @output = `cd '#{project_dir}' && rake stats`
    end

    def analyze
      lines = remove_noise(@output)

      @stats = {}

      set_global_stats(lines.pop)
      set_granular_stats(lines)

      @stats
    end
  
end