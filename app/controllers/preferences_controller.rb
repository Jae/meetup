class PreferencesController < ApplicationController
  def create
    if authenticated? && current_user.id.to_s == params[:user_id]
      if current_user.preference
        current_user.preference.update_attributes(preference_params)
      else
        current_user.create_preference(preference_params)
      end
    end
    redirect_to events_path
  end

  protected
  def preference_params
    start_time_from = Time.zone.parse(params[:preference][:start_times_from])
    start_time_to = Time.zone.parse(params[:preference][:start_times_to])
    {
      user_id: params[:user_id],
      city: params[:preference][:city],
      topic: params[:preference][:topic],
      start_times: start_time_from && start_time_to && (start_time_from..start_time_to)
    }
  end
end
