class News < ActiveRecord::Base
  attr_accessible :author, :content, :is_published, :published_at, :title
  before_save :check_for_publish
  validates :title, :presence => true
  belongs_to :event
  

  def short_content
    maxlength = 32
    (self.content[0...maxlength] || "") + (self.content.length > maxlength ? "..." : "")
  end

  private
    def check_for_publish
      if id
        @is_published = News.find(id).is_published
      else
        @is_published = false
      end

      if self.is_published == true && @is_published == false
        self.published_at = Time.now
      end
      if self.is_published == false && @is_published == true
        self.published_at = nil
      end
    end
end
