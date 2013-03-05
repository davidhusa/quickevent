class Geolocation < ActiveRecord::Base
  attr_accessible :address, :info, :latitude, :longitude, :name
  after_validation :geocode, :if => :address_changed?
  validates :name, :presence => true
  validates :address, :presence => true

  def short_info
    maxlength = 32
    (self.info[0...maxlength] || "") + (self.info.length > maxlength ? "..." : "")
  end

  # used in dashboard so it can grouped with other object types
  def title
    name
  end

  geocoded_by :address
end
