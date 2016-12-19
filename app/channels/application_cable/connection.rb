module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_session

    def connect
      unless current_session
        reject_unauthorized_connection
      else
        logger.add_tags current_session.token
      end
    end

    def current_session
      @current_session ||= cookies.encrypted[:session] && Session.eager_load(:user).find_by(token: cookies.encrypted[:session])
    end
  end
end
