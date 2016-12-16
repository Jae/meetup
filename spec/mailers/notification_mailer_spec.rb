require "rails_helper"

RSpec.describe NotificationMailer, type: :mailer do
  it "send email to the user of new event" do
    user = User.create!(email: "user@test.com")
    event = Event.create!(title: "title",
                          city: "city",
                          start_time: Time.now,
                          end_time: Time.now + 1.hour,
                          topics: ["topic-one", "topic-two"])
    mail = NotificationMailer.new_event(user, event)

    expect(mail.subject).to eq("There's new event that you might be interested in!")
    expect(mail.to).to eq([user.email])
    expect(mail.from).to eq(["meetup@moteefe.com"])

    expect(mail.html_part.body.decoded).to match(/'#{event.title}' in #{event.city}/)
    expect(mail.text_part.body.decoded).to match(/'#{event.title}' in #{event.city}/)

    expect(mail.html_part.body.decoded).to match(/from #{event.start_time} to #{event.end_time}/)
    expect(mail.text_part.body.decoded).to match(/from #{event.start_time} to #{event.end_time}/)
  end
end
