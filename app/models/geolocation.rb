class Geolocation < ActiveRecord::Base
  attr_accessible :address, :info, :latitude, :longitude, :name
end
