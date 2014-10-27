class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path, :notice => "Signed up."
    else
      flash.now[:notice] = "Your submission is invalid."
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
