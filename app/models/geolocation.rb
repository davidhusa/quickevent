class Geolocation < ActiveRecord::Base
  attr_accessible :address, :info, :latitude, :longitude, :name, :event_id
  after_validation :geocode, :if => :address_changed?
  validates :name, :presence => true
  validates :address, :presence => true
  has_many :schedule_item, :dependent => :nullify
  belongs_to :event

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
