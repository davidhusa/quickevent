class Event < ActiveRecord::Base
  attr_accessible :description, :end, :organizer, :start, :title
end
