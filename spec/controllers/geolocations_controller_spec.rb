require 'spec_helper'

describe GeolocationsController do
  let!(:geolocation) { Factory(:geolocation) }

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "Get JSON object of location data" do
     it "returns HTTP success" do
      get 'location_json', :format => :json
      response.should be_success
    end

    it "contains data" do
      visit '/locationjson.json'
      page.should have_content('["my house",47.710369,-122.549111]')
    end
  end

end
