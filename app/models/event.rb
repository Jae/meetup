class Event < ApplicationRecord
  def self.find_by_preference(preference)
    Event.where(city: preference[:city], start_time: preference[:start_times]).
          where("topics @> ?", "{#{preference[:topic]}}")
  end
end
