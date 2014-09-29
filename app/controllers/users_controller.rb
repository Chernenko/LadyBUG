class UsersController < ApplicationController
  before_action :set_user, only: [:show,:edit,:update]

 def new
  @user = User.new
end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "New user has been created."
      redirect_to root_path
  else
    render :new
  end
  end

  def edit;end

  def update
    if @user.update(user_params)
      flash[:notice]= "Profile was updated."
      redirect_to user_path(@user)
    else
      render :edit
    end
    end

def show;end

  def set_user
    @user = User.find_by slug: params[:id]
  end

  def user_params
    params.require(:user).permit(:username,:password,:password_confirmation,:image)
  end





end

