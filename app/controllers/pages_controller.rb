class PagesController < ApplicationController
  def show
  end
  def twitter
    @hashtag = Event.first.twitter_hashtag || "#quickevents"
  end
end
