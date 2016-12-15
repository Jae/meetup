require "rails_helper"

RSpec.describe Event, :type => :model do
  it "Events are found by preference" do
    event = Event.create!(title: "title",
                          city: "city",
                          start_time: Time.now,
                          end_time: Time.now + 1.hour,
                          topics: ["topic-one", "topic-two"])
    preference = Preference.create!(user: User.create!(email: "user@test.com"),
                                    city: "city",
                                    start_times: (event.start_time-30.minutes..event.start_time+30.minutes),
                                    topic: "topic-one")

    expect(Event.find_by_preference(preference)).to include(event)
  end
end
