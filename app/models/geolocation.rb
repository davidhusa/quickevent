class Geolocation < ActiveRecord::Base
  attr_accessible :address, :info, :latitude, :longitude, :name
  after_validation :geocode, :if => :address_changed?

  def short_info
    maxlength = 32
    (self.info[0...maxlength] || "") + (self.info.length > maxlength ? "..." : "")
  end

  geocoded_by :address
end
