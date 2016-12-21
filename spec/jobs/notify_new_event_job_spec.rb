require 'rails_helper'

RSpec.describe NotifyNewEventJob, type: :job do
  it "deliver new event notification via websocket to a user who's logged in" do
    user = User.create!(email: "user@test.com")
    Session.create!(user: user)
    preference = Preference.new(user: user)
    event = instance_double(Event)

    allow(Preference).to receive(:find_by_event).and_return([preference])
    allow(NewEventNotificationChannel).to receive(:broadcast_to)
    NotifyNewEventJob.perform_now(event)

    expect(Preference).to have_received(:find_by_event).with(event)
    expect(NewEventNotificationChannel).to have_received(:broadcast_to).with(user, event)
  end

  it "deliver new event notification email to a user who's not logged in" do
    user = User.create!(email: "user@test.com")
    preference = Preference.new(user: user)
    event = instance_double(Event)
    mail = instance_spy(ActionMailer::MessageDelivery)

    allow(Preference).to receive(:find_by_event).and_return([preference])
    allow(NotificationMailer).to receive(:new_event).and_return(mail)
    NotifyNewEventJob.perform_now(event)

    expect(Preference).to have_received(:find_by_event).with(event)
    expect(NotificationMailer).to have_received(:new_event).with(user, event)
    expect(mail).to have_received(:deliver_later)
  end
end
