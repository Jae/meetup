class PreferencesController < ApplicationController
  def create
    if authenticated? && current_user.id.to_s == params[:user_id]
      Preferences.create!(current_user, params[:preference]) rescue nil
    end
    redirect_to events_path
  end
end
