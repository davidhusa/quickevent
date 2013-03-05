class Page < ActiveRecord::Base
  attr_accessible :content, :title


  # this turns the title into something url-friendly before saving
  before_validation { |page| page.title = page.title.downcase.gsub(' ', '-') }
  validates :title, :uniqueness => true
  validates :title, :presence => true
  validates_format_of :title, :without => /\//, :message => "Cannot use forward slash in titles."
  validates_exclusion_of :title,
                         :in => ["admin", "news", "map", "locations",
                          "schedule", "twitter", "about", "locationjson"],
                          :message => "That page title is reserved."

  # this makes it Title Case again
  def pretty_title
    self.title.gsub('-', ' ').titlecase
  end

  def short_content
    maxlength = 32
    (self.content[0...maxlength] || "") + (self.content.length > maxlength ? "..." : "")
  end
end
