$:.push File.expand_path("../../templates", __FILE__)
require 'metadata'

require 'rails/generators'
#require 'rails/generators/migration'


module RubyStats
  module Generators
	class InstallGenerator < Rails::Generators::Base
	  #include Rails::Generators::Migration
	  
	  source_root File.expand_path("../../templates", __FILE__)

	  #def self.next_migration_number(dirname) #:nodoc:
	  #  if ActiveRecord::Base.timestamped_migrations
	  #	   Time.now.utc.strftime("%Y%m%d%H%M%S")
	  #  else
	  #	   "%.3d" % (current_migration_number(dirname) + 1)
	  #  end
	  #end

	  # This method is pulling all of the migration data from the migration.rb template.
	  # After it pulls the migration date, it generates a migration in the main application
	  # called create_ruby_stats_model_data...
	  # You can change the name of this if and when you make your own engine.
	  #def create_migration_file
	  #  migration_template 'migration.rb', 'db/migrate/create_ruby_stats_model_data.rb'
	  #end
	  
	  #Add programming language to application's database
	  def add_programming_language
		ProgrammingLanguage.table_exists?
		p_language = RubyStats::Metadata::PROGRAMMING_LANGUAGE
		if ProgrammingLanguage.find_by_name(p_language).nil?
		  ProgrammingLanguage.create!(:name => p_language)
		end
	  rescue
		raise "ActiveRecord::ProgrammingLanguage does not exist."
	  end
	  
	  #Add metric to application's database
	  def add_metric
		p_language = ProgrammingLanguage.find_by_name(RubyStats::Metadata::PROGRAMMING_LANGUAGE)
		  
		begin
		  Metric.table_exists?
		  metric_analyser = RubyStats::Metadata::ANALYSER
		  metric_name = RubyStats::Metadata::NAME
		  if Metric.find_by_name(metric_name).nil?
			metric = Metric.new(:name => metric_name, :analyser => metric_analyser)
			metric.programming_language = p_language
			metric.save!
		  end  
		rescue
		  raise "ActiveRecord::Metric does not exist."
		end
	  end
	  
	  def end_install
		puts "#{RubyStats::Metadata::ANALYSER}: #{RubyStats::Metadata::PROGRAMMING_LANGUAGE} #{RubyStats::Metadata::NAME} sucessfully installed!"
	  end
	end
  end
end