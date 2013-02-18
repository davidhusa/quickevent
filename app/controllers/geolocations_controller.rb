class GeolocationsController < ApplicationController
  def index
    @latitude = Geolocation.first.latitude
    @longitude = Geolocation.first.longitude
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
