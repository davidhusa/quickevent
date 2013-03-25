class NewsController < ApplicationController
  def index
    raw_news = News.where("event_id = ?", params[:event_id]).order(:published_at).where("is_published = ?", true).reverse || []

    @news = Array.new
    last_date = nil

    raw_news.each do |item|
      unless item.published_at.to_date == last_date
        @news << item.published_at
        last_date = item.published_at.to_date
      end
      @news << item
    end

  end
end
