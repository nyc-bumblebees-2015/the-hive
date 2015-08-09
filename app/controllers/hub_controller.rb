class HubController < ApplicationController
  def index
    if !is_authenticated?
      @user = User.new
      render :splash
    else
      @user = current_user
    end
  end