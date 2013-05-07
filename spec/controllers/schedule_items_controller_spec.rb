require 'spec_helper'

describe ScheduleItemsController do
  let!(:event) { Factory(:event) }

  describe "GET 'index'" do

    it "returns http success" do
      get 'index', event_id: event.url
      response.should be_success
    end
  end

end
