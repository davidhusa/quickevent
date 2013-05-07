class PagesController < ApplicationController
  before_filter :verify_event_path, :except => :all
  def show # generic pages
    @page = Page.where("event_id = ?", event_info.id).find_by_title(params[:title])
    if @page == nil
      flash[:notice] = "Page not found"
      redirect_to root_path
    end
  end
  def twitter

  end
  def home #Home/root for a specific event
    @pages = Page.where("event_id = ?", event_info.id).all
  end
  def about
    #@event_info = Event.find_by_url(params[:event_id])
  end

  def all #temporary root, a list of all event sites up
    @events = Event.all
  end
end
