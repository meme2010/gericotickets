class UsersController < ApplicationController
  def index
  	@users = User.all 
  end
  
  def create
  	@user = User.create
  end
  
  def new
  	@user = User.new
  	@user.save
  end
  
  def edit
  end
  
  def show
  	@user = User.find(params[:id])
  end
  
  def update
  end

  def destroy
  	@user = User.find(params[:id])
    @user.destroy
  end
end
