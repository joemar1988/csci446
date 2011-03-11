class UserSessionsController < ApplicationController

  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Logged in successfully."
      if User.find_by_username(@user_session.username).roles.name == "admin"
         redirect_to root_admin_path
      else
         redirect_to root_member_path
      end
    else
      render :action => 'new'
    end
  end

def destroy
  @user_session = UserSession.find
  @user_session.destroy
  flash[:notice] = "Successfully logged out."
  redirect_to root_url
end

  
end
