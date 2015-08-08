class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
    @user.password = params[:user][:password]
		if @user.save
			session[:user_id] = @user.id
			redirect_to :root
		else
			flash.now[:errors] = @user.errors.full_messages
		  render :new
		end
	end

  def show
    require_login
    @user = User.find_by(id: params[:id])
    @projects_created = @user.projects_created
    @projects_collaborated_on = @user.projects_collaborated_on
  end

  def edit
    require_login
    @user = User.find_by(id: params[:id])
    require_current_user(@user)
  end

  def update
    user = User.find_by(id: params[:id])
    require_current_user(user)
    user.update_attributes(user_params)
    if user.save 
      flash[:success] = "Your profile has been updated!"
      redirect_to user_path(user)
    else
      flash[:errors] = user.errors.full_messages
      redirect_to edit_user_path(user)
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :username, :zip_code, 
                                 :bio, :github_link, :website_link)
  end
end
