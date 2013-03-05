class ScheduleItem < ActiveRecord::Base
  belongs_to :geolocation
  attr_accessible :end, :info, :location, :map_url, :name, :start, :geolocation_id

  validates :name, :presence => true
  validates :start, :presence => true


  def short_info
    maxlength = 32
    (self.info[0...maxlength] || "") + (self.info.length > maxlength ? "..." : "")
  end

  # used in dashboard so it can grouped with other object types
  def title
    name
  end

  
  
end
