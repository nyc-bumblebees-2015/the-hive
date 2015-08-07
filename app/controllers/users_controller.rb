class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to :root
		else
			flash.now[:error] = user.errors.full_messages
		  render :new
		end
	end

  def show
    @user = User.find_by(id: params[:id])
    @projects_created = @user.projects_created
    @projects_collaborated_on = @user.projects_collaborated_on
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    user = User.find_by(id: params[:id])
    user.update_attributes(user_params)
    if user.save 
      flash[:success] = "Your profile has been updated!"
      redirect_to user_path(user)
    else
      flash[:error] = user.errors.full_messages
      redirect_to edit_user_path(user)
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :username, :zip_code, 
                                 :bio, :github_link, :website_link)
  end
end
