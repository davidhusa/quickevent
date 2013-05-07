class NewsController < ApplicationController
  def index
    @news = get_published_news_and_date_headers
  end

  private
    def get_published_news_and_date_headers
      raw_news = News.where("event_id = ?", event_info.id).order(:published_at).where("is_published = ?", true).reverse || []
      news_and_headers = Array.new
      last_date = nil

      raw_news.each do |item|
        unless item.published_at.to_date == last_date
          news_and_headers << item.published_at
          last_date = item.published_at.to_date
        end
        news_and_headers << item
      end
      
      news_and_headers
    end
end
