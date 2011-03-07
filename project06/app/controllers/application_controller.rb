class ApplicationController < ActionController::Base

  include Authentication
  helper :all 
  protect_from_forgery 
  before_filer{|c|Authorization.current_user=c.current_user}

end