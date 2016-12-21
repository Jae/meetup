class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :authenticated?, :current_session, :current_user

  def login(current_session)
    @current_session = current_session
    cookies.encrypted[:session] = session[:token] = current_session.token
  end

  def logout
    current_session.destroy! if current_session
    @current_session = cookies.encrypted[:session] = session[:token] = nil
  end

  def authenticated?
    !current_session.nil?
  end

  def current_user
    current_session.try(:user)
  end

  def current_session
    @current_session ||= session[:token] && Session.eager_load(:user).find_by(token: session[:token])
  end
end
