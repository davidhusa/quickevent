class GeolocationsController < ApplicationController
  def index
    @geolocations = Geolocation.all
  end
end
