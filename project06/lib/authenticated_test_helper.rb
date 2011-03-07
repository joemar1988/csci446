module AuthenticatedTestHelper
  # Sets the current user_sessions in the session from the user_sessions fixtures.
  def login_as(user_sessions)
    @request.session[:user_sessions_id] = user_sessions ? (user_sessions.is_a?(UserSessions) ? user_sessions.id : user_sessions(user_sessions).id) : nil
  end

  def authorize_as(user_sessions)
    @request.env["HTTP_AUTHORIZATION"] = user_sessions ? ActionController::HttpAuthentication::Basic.encode_credentials(user_sessions(user_sessions).login, 'monkey') : nil
  end
  

end
