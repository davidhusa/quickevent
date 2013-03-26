class Event < ActiveRecord::Base
  attr_accessible :description, :end, :organizer, :start, :title, :twitter_hashtag, :url

  validates :title, :presence => true
  validates :organizer, :presence => true
  validates_format_of :url, :without => /\//, :message => "Cannot use forward slash in URL."
  validates_format_of :title , :without => /\//, :message => "Cannot use forward slash in Title."
  validates_uniqueness_of :url, :case_sensitive => false
    # In serious production setting, must also enforce uniqueness of event URLs on database level

  # before_validation do |event|
  #   if event.url
  #     event.url.downcase.gsub('', '-')
  #   else
  #     event.url = event.title.downcase.gsub(' ', '-')
  #   end
  # end


  has_many :admin_users
  has_many :pages
  has_many :geolocations
  has_many :news
  has_many :pages
  has_many :schedule_items

  def short_description
    if description
      maxlength = 32
      (self.description[0...maxlength] || "") + (self.description.length > maxlength ? "..." : "")
    else
      ""
    end
  end
end
