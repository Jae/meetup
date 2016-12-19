class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    logout
    user = User.find_or_create_by(user_params.slice(:email))
    if user.persisted?
      login(Session.create!(user: user))
    else
      flash[:authentication_error] = {
        class: "danger",
        message: "Failed to authenticate, #{user.errors.full_messages.join(", ")}"
      }
    end
    redirect_to root_path
  end

  def destroy
    logout
    redirect_to root_path
  end

  protected
  def user_params
    ActionController::Parameters.new(request.env['omniauth.auth']['info']).permit!
  end
end
