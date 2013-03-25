class PagesController < ApplicationController
  def show
    @page = Page.where("event_id = ?", params[:event_id]).find_by_title(params[:title])
    if @page == nil
      flash[:notice] = "Page not found"
      redirect_to root_path
    end
  end
  def twitter
    # @hashtag = "##{Event.first.twitter_hashtag}" || "#quickevents"
  end
  def home
    #@pages = Page.where("event_id = ?", params[:event_id]).all
    @pages = Page.where("event_id = ?", params[:event_id]).all
  end
  def about
    @event_info = Event.find(params[:event_id])
  end
end
