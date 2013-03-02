class ScheduleItem < ActiveRecord::Base
  belongs_to :geolocation
  attr_accessible :end, :info, :location, :map_url, :name, :start, :geolocation_id

  def short_info
    maxlength = 32
    (self.info[0...maxlength] || "") + (self.info.length > maxlength ? "..." : "")
  end
end
