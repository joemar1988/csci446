class ApplicationController < ActionController::Base

  include Authentication
  helper :all 
  protect_from_forgery 
  before_filer{|c|Authorization.current_user=c.current_user}
  
  protected
  
    def permission_denied
      flash[error]="DENIED! You do not have permission to view this page."
      redirect_to root_url
    end

end