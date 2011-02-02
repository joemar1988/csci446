class ApplicationController < ActionController::Base
  
  layout "store"
  before_filter :authorize, :except => :login
  helper :all # include all helpers, all the time
  protect_from_forgery :secret => '8fc080370e56e929a2d5afca5540a0f7'
    
protected

  def authorize
    unless User.find_by_id(session[:user_id])
      flash[:notice] = "Please log in"
      redirect_to :controller => 'admin', :action => 'login'
    end
  end
end