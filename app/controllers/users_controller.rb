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
    if @user.presisted?
      render json: {created: true}
    else
      render json:{errors: @user.errors.full_messages, }, status: 422
end
end

 def find
   @user = User.find_by(email: params[:user][:email])
   if @user
     render json: @user
   else
     @errors = @user.errors.full_messages
     render json: @errors
   end
end
   def set_user
     @user = User.find_by(id: params[:id])
   end
 end

private
def user_params
  params.require(:user).permit(:name, :password, :password_confirmation,
    :email, :phone_number, :address, :admin)
end
