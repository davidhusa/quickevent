class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :event_info

  protected
  def event_info
    if @event_info
      @event_info
    else
      if params[:event_id]
        @event_info = Event.find_by_url(params[:event_id].downcase) || 
                      Event.new(:title => "Untitled Event",
                                :twitter_hashtag => "events",
                                :start => Time.now,
                                :end => Time.now)
      else
        @event_info = Event.new(:title => "Quick Event")
      end
    end
  end

  def verify_event_path
    if params[:event_id]
      if Event.where("url = ?", params[:event_id]) == []
        flash[:notice] = "Event '#{params[:event_id].titlecase}' not found."
        redirect_to root_path
      end
    end
  end

end
