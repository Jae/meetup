require "rails_helper"

RSpec.describe Preference, :type => :model do
  it "Preferences are found by event" do
    preference = Preference.create!(user: User.create!(email: "user@test.com"),
                                    city: "city",
                                    start_times: (Time.now..Time.now + 1.hour),
                                    topic: "topic-one")
    event = Event.create!(title: "title",
                          city: preference.city,
                          start_time: preference.start_times.first + 30.minutes,
                          end_time: preference.start_times.last + 30.minutes,
                          topics: [preference.topic])

    expect(Preference.find_by_event(event)).to include(preference)
  end
end
