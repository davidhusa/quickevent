class Event < ActiveRecord::Base
  attr_accessible :description, :end, :organizer, :start, :title, :twitter_hashtag

  def short_description
    maxlength = 32
    (self.description[0...maxlength] || "") + (self.description.length > maxlength ? "..." : "")
  end
end
