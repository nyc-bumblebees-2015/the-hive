class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to :root
		else
			flash.now[:error] = @user.errors.full_messages
		  render :new
		end

	end

	private
	  def user_params
			params.require(:user).permit(:username, :first_name, :last_name, :email, :username, :password, :password_cofirmation, :zip_code)
		end
end
