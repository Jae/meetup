require "rails_helper"

RSpec.describe Preferences do
  it "create new preference" do
    user = User.create!(email: "user@test.com")
    preference = Preferences.create!(user, city: "city",
                                           topic: "topic",
                                           start_times_from: "2016-12-20T00:00:00",
                                           start_times_to: "2017-01-01T00:00:00")

    preference.tap do |preference|
      expect(preference.user).to eq(user)
      expect(preference.city).to eq("city")
      expect(preference.topic).to eq("topic")
      expect(preference.start_times).to eq((Time.new(2016,12,20)..Time.new(2017,1,1)))
    end
  end

  it "update existing preference" do
    user = User.create!(email: "user@test.com")
    existing_preference = user.create_preference!(city: "city",
                                                  topic: "topic",
                                                  start_times: (Time.new(2016,12,20)..Time.new(2017,1,1)))
    preference = Preferences.create!(user, city: "new-city",
                                           topic: "new-topic",
                                           start_times_from: "2016-12-24T00:00:00",
                                           start_times_to: "2017-01-04T00:00:00")

    preference.tap do |preference|
      expect(preference.user).to eq(user)
      expect(preference.id).to eq(existing_preference.id)
      expect(preference.city).to eq("new-city")
      expect(preference.topic).to eq("new-topic")
      expect(preference.start_times).to eq((Time.new(2016,12,24)..Time.new(2017,1,4)))
    end
  end
end
