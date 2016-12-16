class NotifyNewEventJob < ApplicationJob
  queue_as :default

  def perform(event)
    Preference.find_by_event(event).each do |preference|
      preference.user.tap do |user|
        if user.logged_in?
          
        else
          NotificationMailer.new_event(user, event).deliver_later
        end
      end
    end
  end
end
