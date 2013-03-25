class GeolocationsController < ApplicationController
  def index
    @locations = Geolocation.where("event_id = ?", params[:event_id]).all
    # if Geolocation.first
    #   @latitude = Geolocation.first.latitude
    #   @longitude = Geolocation.first.longitude
    # else
    #   @latitude, @longitude = 0, 0
    #   flash[:alert] = "No map locations loaded."
    # end
  end

  def show
    @location = Geolocation.where("event_id = ?", params[:event_id]).find(params[:id])
  end

  def location_json
    @all_info = Geolocation.where("event_id = ?", params[:event_id]).all

    @all_locations = []

    @all_info.each do |location|
      @all_locations << [location.name, location.latitude, location.longitude]
    end

    respond_to do |format|
      format.json { render json: @all_locations }
    end
  end
end
