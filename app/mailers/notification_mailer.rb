class NotificationMailer < ApplicationMailer
  def new_event(user, event)
    @event = event
    mail(to: user.email, subject: "There's new event that you might be interested in!")
  end
end
