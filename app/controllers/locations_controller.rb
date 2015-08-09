class LocationsController < ApplicationController

  def search
    if params[:search_input].present?
      p "********************"
      #p input_location
      @locations = Location.near(params[:search_input], 20, :order => :distance)
      render :results
    end
  end

end
