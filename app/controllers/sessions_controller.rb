class SessionsController < ApplicationController
  def new
    if session[:user_id]
      redirect_to users_path
    end
  end

  def create
    user = User.authenticate(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_path, :notice => "Logged in!"
    else
      flash.now[:notice]= "Invalid email or password."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Successfully logged out."
  end

  # private

  # def user_params
  #   params.require(:session).permit(:email, :password)
  # end
end
