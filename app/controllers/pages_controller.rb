class PagesController < ApplicationController
  def show
    @page = Page.find_by_title(params[:title])
    if @page == nil
      flash[:notice] = "Page not found"
      redirect_to root_path
    end
  end
  def twitter
    @hashtag = Event.first.twitter_hashtag || "#quickevents"
  end
  def home
  end
  def about
  end
end
