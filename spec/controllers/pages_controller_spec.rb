require 'spec_helper'

describe PagesController do
  let!(:event) { Factory(:event) }
  let!(:a_page) { Factory(:page) }
  before do
    a_page.event_id = event.id
    a_page.save
  end

  describe "GET 'show'" do
    it "returns http success" do
      visit "/#{event.url}/#{a_page.title}"
      response.should be_success
    end
  end



end
