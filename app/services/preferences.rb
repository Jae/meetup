class Preferences
  def self.create!(user, params)
    if user.preference
      user.preference.update_attributes!(preference_params(params))
      user.preference
    else
      user.create_preference!(preference_params(params))
    end
  end

  private
  def self.preference_params(params)
    start_time_from = Time.zone.parse(params[:start_times_from] || "")
    start_time_to = Time.zone.parse(params[:start_times_to] || "")
    {
      city: params[:city],
      topic: params[:topic],
      start_times: start_time_from && start_time_to && (start_time_from..start_time_to)
    }
  end
end
