class UsersController < ApplicationController
  before_action :require_login, only: [:show, :edit, :update]
  before_action :check_privileges, only: [:edit, :update]

	# def new
	# 	@user = User.new
	# end

	def create
		@user = User.new(user_params)
    @user.password = params[:user][:password]
		if @user.save
			session[:user_id] = @user.id
    else
      flash[:errors] = @user.errors.full_messages
    end
		redirect_to root_path
	end

  def show
    @user = User.find_by(id: params[:id])
    @projects_created = @user.projects_created
    @projects_collaborated_on = @user.approved_collaborations
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    user = User.find_by(id: params[:id])
    user.assign_attributes(user_params)
    if user.save
      flash[:notice] = "Your profile has been updated!"
      redirect_to user_path(user)
    else
      flash[:errors] = user.errors.full_messages
      redirect_to edit_user_path(user)
    end
  end


  private
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :username, :zip_code, :bio, :github_link, :website_link)
  end

  def check_privileges
    unless current_user.id == params[:id].to_i
     redirect_to root_path, notice: "not authorized!"
    end
  end

end
