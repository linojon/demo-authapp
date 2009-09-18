class InfosController < ApplicationController
  before_filter :login_required
  
  def index
    @infos = Info.all
  end
  
  def show
    @info = Info.find(params[:id])
  end
  
  def new
    @info = Info.new
  end
  
  def create
    @info = Info.new(params[:info])
    if @info.save
      flash[:notice] = "Successfully created info."
      redirect_to @info
    else
      render :action => 'new'
    end
  end
  
  def edit
    @info = Info.find(params[:id])
  end
  
  def update
    @info = Info.find(params[:id])
    if @info.update_attributes(params[:info])
      flash[:notice] = "Successfully updated info."
      redirect_to @info
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @info = Info.find(params[:id])
    @info.destroy
    flash[:notice] = "Successfully destroyed info."
    redirect_to infos_url
  end
end
