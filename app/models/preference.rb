class Preference < ApplicationRecord
  belongs_to :user

  def self.find_by_event(event)
    Preference.where(city: event[:city], topic: event[:topics]).
               where("start_times @> ?::timestamp", event[:start_time])
  end
end
