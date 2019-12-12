class UsersController < ApplicationController

  def current
    render :json => {}
  end

  def index
    @users = User.all
    render :json => @users
  end

  def show
    @user = User.find params[:id]
  end

  def edit
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
  end
end

private
def user_params
  params.require(:user).permit(:name, :password, :password_confirmation,
    :email, :phone_number, :address, :admin)
end
