class HubController < ApplicationController
  def index
    if !is_authenticated?
      @user = User.new
      render :splash
    else
      @user = current_user
      @users_near_me = User.near(current_user.zip_code, 20, :order => 'distance').where.not(:id => current_user.id)
      @projects = []
    	@users_near_me.each do |user|
      	user.projects_created.each do |project|
        	@projects << project
      	end
    	end
    end
    @tags = Tag.most_popular
  end
end
