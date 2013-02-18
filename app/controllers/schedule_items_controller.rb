class ScheduleItemsController < ApplicationController
  def index
    @schedule = ScheduleItem.all
  end
end
