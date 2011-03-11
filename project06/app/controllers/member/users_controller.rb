class Member::UsersController < ApplicationController

  before_filter :previous_page, :only => [:edit]
  filter_resource_access
  
  def new
	@user = User.new
  end

  def create
	@user = User.new(params[:user])
	if @user.save
		redirect_to member_root_url, :notice => "Registration Successful"
	else
		render "new"
	end
  end
  
  def login
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => [:member,@users] }
    end
  end
  
  
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => [:member,@user].errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  private
   
  def previous_page
	session[:redirect] = request.referer
  end
end
