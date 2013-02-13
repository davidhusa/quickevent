class Page < ActiveRecord::Base
  attr_accessible :content, :title

  # this turns the title into something url-friendly before saving
  # remember to add a helper method later to make it human-friendly Title Case!!!!!
  before_validation { |page| page.title = page.title.downcase.gsub(' ', '-') }

end
