class EventsController < ApplicationController
  def index
    if current_session
      if @preference = current_preference
        @events = events(Event.find_by_preference(@preference))
      else
        @preference = new_preference
        @events = events(Event.all)
      end
    else
      @events = events(Event.all)
    end
  end

  private
  def current_preference
    current_session && current_session.user.preference && PreferenceDecorator.new(current_session.user.preference)
  end

  def new_preference
    current_session && PreferenceDecorator.new(current_session.user.build_preference)
  end

  def events(events)
    events.map {|e| EventDecorator.new(e)}
  end
end
