class ScheduleItemsController < ApplicationController
  def index
    @schedule = ScheduleItem.order(:start)
  end
end
