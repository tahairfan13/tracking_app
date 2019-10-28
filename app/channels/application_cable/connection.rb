module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user request.params[:token]
      logger.add_tags 'ActionCable', current_user
    end

    private
    def find_verified_user(token)
      session = Auth::Session.find_by(token: token)
      unless session.nil?
        return session
      else
        return reject_unauthorized_connection
      end
    end
  end
end
