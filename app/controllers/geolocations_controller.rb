class GeolocationsController < ApplicationController
  def index
    if Geolocation.first
      @latitude = Geolocation.first.latitude
      @longitude = Geolocation.first.longitude
    else
      @latitude, @longitude = 0, 0
      flash[:alert] = "No map locations loaded."
    end
  end

  def location_json
    @all_info = Geolocation.all

    @all_locations = []

    @all_info.each do |location|
      @all_locations << [location.name, location.latitude, location.longitude]
    end

    respond_to do |format|
      format.json { render json: @all_locations }
    end
  end
end
