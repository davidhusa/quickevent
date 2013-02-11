class Geolocation < ActiveRecord::Base
  attr_accessible :address, :info, :latitude, :longitude, :name
  after_validation :geocode, :if => :address_changed?

  geocoded_by :address
end
