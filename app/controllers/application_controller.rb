class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_session

  def login(current_session)
    session[:token] = current_session.token
  end

  def logout
    session[:token] = nil
  end

  def current_session
    @current_session ||= session[:token] && Session.find_by(token: session[:token])
  end
end
