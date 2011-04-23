module RubyStats
  module ApplicationHelper

    # This method returns an abbreviated time format which is defined in the date.rb
    # located in config/initializers
    def time_ab(time)
      time.to_s(:abbrev_date)
    end

  end
end