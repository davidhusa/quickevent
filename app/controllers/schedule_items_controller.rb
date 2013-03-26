class ScheduleItemsController < ApplicationController
  def index
    raw_schedule = ScheduleItem.where("event_id = ?", event_info.id).order(:start) || []

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