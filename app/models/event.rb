class Event < ApplicationRecord
  validates :title, :city, :start_time, :end_time, presence: true
  validates_each :start_time, :end_time, allow_blank: true do |record, attr, value|
    record.errors.add attr, :invalid unless value.is_a?(Time)
  end

  def self.find_by_preference(preference)
    Event.where(city: preference[:city], start_time: preference[:start_times]).
          where("topics @> ?", "{#{preference[:topic]}}")
  end
end
