require "rails_helper"

RSpec.describe Events do
  it "creates a new event then notify interested users of it" do
    allow(NotifyNewEventJob).to receive(:perform_later)
    event = Events.create!(title: "title",
                           address: "address",
                           city: "city",
                           start_time: "2016-12-20T18:00:00",
                           end_time: "2016-12-20T21:00:00",
                           topics: ["topic"])

    expect(event.title).to eq("title")
    expect(event.address).to eq("address")
    expect(event.city).to eq("city")
    expect(event.start_time).to eq(Time.new(2016,12,20,18))
    expect(event.end_time).to eq(Time.new(2016,12,20,21))
    expect(event.topics).to eq(["topic"])
    expect(NotifyNewEventJob).to have_received(:perform_later).with(event)
  end
end
