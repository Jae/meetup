require 'rails_helper'

RSpec.describe NotifyNewEventJob, type: :job do
  it "deliver new event notification via websocket to a user who's logged in" do
    user = User.create!(email: "user@test.com")
    Session.create!(user: user)

    event = instance_double(Event)
    preference = Preference.new(user: user)
    expect(Preference).to receive(:find_by_event).with(event).and_return([preference])
    expect(NewEventNotificationChannel).to receive(:broadcast_to).with(user, event)

    NotifyNewEventJob.perform_now(event)
  end

  it "deliver new event notification email to a user who's not logged in" do
    user = User.create!(email: "user@test.com")

    event = instance_double(Event)
    preference = Preference.new(user: user)
    mail = instance_double(ActionMailer::MessageDelivery)
    expect(Preference).to receive(:find_by_event).with(event).and_return([preference])
    expect(NotificationMailer).to receive(:new_event).with(user, event).and_return(mail)
    expect(mail).to receive(:deliver_later)

    NotifyNewEventJob.perform_now(event)
  end
end
