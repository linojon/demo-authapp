class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create]
	before_filter :find_user, :except => [:new, :create]
	
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Thank you for signing up! You are now logged in."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def show
  end
	
	def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user profile."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
	
	private

  def find_user
    @user = current_user
  end
	
end
