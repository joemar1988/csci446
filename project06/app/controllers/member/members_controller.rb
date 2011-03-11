class Member::MembersController < ApplicationController
  before_filter :require_no_user :only => [:new, :create]
  
  filter_access_to :require_user :only => [:update, :index]
  
  
  
  def index
	@member = Member.new
  end

  def create
	@member = Member.new(params[:member])
	if @member.save
		redirect_to root_url, :notice => "Registration Successful"
	else
		render "new"
	end
  end
 protected
 
   def permission_denied
      flash[error]="You do not have permission to view this page!"
      respond.to do |format|
	    format.hmtl { redirect_to member_root_url}
		format.xml {head :unauthorized}
		format.js {head :unauthorized}
	  redirect_to root_url
	  end
   end  
  
end
