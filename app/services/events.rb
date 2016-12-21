class Events
  def self.create!(params)
    Event.create!(event_params(params)).tap do |event|
      NotifyNewEventJob.perform_later(event)
    end
  end

  private
  def self.event_params(params)
    {
      title: params[:title],
      address: params[:address],
      city: params[:city],
      start_time: Time.zone.parse(params[:start_time] || ""),
      end_time: Time.zone.parse(params[:end_time] || ""),
      topics: params[:topics]
    }
  end
end
