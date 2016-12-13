class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    current_session.destroy! if current_session
    user = User.find_or_create_by(auth_hash.slice(:email))
    return env["omniauth.strategy"].fail!(:invalid_authentication) unless user.persisted?
    login(Session.create!(user: user))
    redirect_to root_path
  end

  def destroy
    current_session.destroy! if current_session
    logout
    redirect_to root_path
  end

  protected
  def auth_hash
    @auth_hash ||= ActionController::Parameters.new(request.env['omniauth.auth']['info']).permit(:email)
  end
end
