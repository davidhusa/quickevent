class NewsController < ApplicationController
  def index
    @news = News.order(:published_at).where("is_published = ?", true).reverse
  end
end
