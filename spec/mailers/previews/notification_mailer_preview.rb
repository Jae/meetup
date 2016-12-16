# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview
  def new_event
    user = User.new(email: "user@test.com")
    event = Event.new(title: "title",
                      city: "city",
                      start_time: Time.now,
                      end_time: Time.now + 1.hour,
                      topics: ["topic-one", "topic-two"])
    NotificationMailer.new_event(user, event)
  end
end
