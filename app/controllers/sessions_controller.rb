class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    logout
    current_session.destroy! if current_session
    user = User.find_or_create_by(auth_hash.slice(:email))
    return redirect_to "/auth/failure" unless user.persisted?
    login(Session.create!(user: user))
    redirect_to root_path
  end

  def destroy
    logout
    current_session.destroy! if current_session
    redirect_to root_path
  end

  protected
  def auth_hash
    @auth_hash ||= ActionController::Parameters.new(request.env['omniauth.auth']['info']).permit!
  end
end
