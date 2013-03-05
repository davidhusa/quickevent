class News < ActiveRecord::Base
  attr_accessible :author, :content, :is_published, :published_at, :title

  def short_content
    maxlength = 32
    (self.content[0...maxlength] || "") + (self.content.length > maxlength ? "..." : "")
  end


end
