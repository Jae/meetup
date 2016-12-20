class NewEventNotificationChannel < ApplicationCable::Channel
  def self.broadcast_to(user, event)
    event = EventDecorator.new(event)
    super(user, {
      title: event.title,
      address: event.address,
      city: event.city,
      start_time: event.start_time,
      end_time: event.end_time,
      topics: event.topics.join(", ")
    })
  end

  def subscribed
    stream_for current_session.user
  end
end
