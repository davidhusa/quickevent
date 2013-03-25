module EventSpecificModel
  def current_event
    self.where("event_id = ?", params[:event_id])
  end
end