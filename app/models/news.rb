class News < ActiveRecord::Base
  attr_accessible :author, :content, :is_published, :published_at, :title
end
