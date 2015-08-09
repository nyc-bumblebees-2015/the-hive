class HubController < ApplicationController
  def index
    if !is_authenticated? 
      render :splash
    else
      @user = current_user
    end
  end
end
