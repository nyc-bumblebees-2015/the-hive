class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to :root
    else
      flash.now[:errors] = ["Incorrect username or password."]
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path, notice: "You have successfully logged out."
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
