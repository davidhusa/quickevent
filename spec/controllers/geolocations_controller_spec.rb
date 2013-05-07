require 'spec_helper'

describe GeolocationsController do
  let!(:event) { Factory(:event) }
  let!(:geolocation) { Factory(:geolocation, event: event) }

  describe "GET 'index'" do
    it "returns http success" do
      get "index", event_id: event.url
      response.should be_success
    end
  end

  describe "Get JSON object of location data" do
     it "returns HTTP success" do
      get "location_json", :format => :json, event_id: event.url
      response.should be_success
    end

    it "contains data" do
      visit "/#{event.url}/locationjson.json"
      page.should have_content('["my house",47.710369,-122.549111]')
    end
  end

end