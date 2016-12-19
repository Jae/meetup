class Preference < ApplicationRecord
  belongs_to :user

  validates :city, :topic, :start_times, presence: true
  validates_each :start_times, allow_blank: true do |record, attr, value|
    unless value.is_a?(Range) && value.first.is_a?(Time) && value.last.is_a?(Time) && value.first < value.last
      record.errors.add attr, :invalid
    end
  end

  def self.find_by_event(event)
    Preference.where(city: event[:city], topic: event[:topics]).
               where("start_times @> ?::timestamp", event[:start_time])
  end
end
