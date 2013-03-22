class ScheduleItemsController < ApplicationController
  def index
    raw_schedule = ScheduleItem.order(:start) || []

    @schedule = Array.new
    last_date = nil

    raw_schedule.each do |item|
      unless item.start.to_date == last_date
        @schedule << item.start
        last_date = item.start.to_date
      end
      @schedule << item
    end

  end
end

    # raw_news = News.order(:published_at).where("is_published = ?", true).reverse || []

    # @news = Array.new
    # last_date = nil

    # raw_news.each do |item|
    #   unless item.published_at.to_date == last_date
    #     @news << item.published_at
    #     last_date = item.published_at.to_date
    #   end
    #   @news << item
    # end
