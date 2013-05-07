class GeolocationsController < ApplicationController
  def index
    @locations = Geolocation.where("event_id = ?", event_info.id).all
  end

  def show
    @location = Geolocation.where("event_id = ?", event_info.id).find(params[:id])
  end

  def location_json
    @all_info = Geolocation.where("event_id = ?", event_info.id).all

    @all_locations = []

    @all_info.each do |location|
      @all_locations << [location.name, location.latitude, location.longitude]
    end

    respond_to do |format|
      format.json { render json: @all_locations }
    end
  end
end
