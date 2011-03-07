class Admin::AdminController < ApplicationController

  before_filter :require_all  
  filter_Access_to :all
  
  def new
	@admin = Admin.new
  end

  def create
	@admin = Admin.new(params[:admin])
	
    if @admin.save
		redirect_to root_url, :notice => "You have successfully registered."
	else
		render "new"
	end
  end
end
