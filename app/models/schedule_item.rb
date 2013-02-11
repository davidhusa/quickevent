class ScheduleItem < ActiveRecord::Base
  belongs_to :geolocation
  attr_accessible :end, :info, :location, :map_url, :name, :start
end
