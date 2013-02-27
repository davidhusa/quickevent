require 'spec_helper'

describe PagesController do
    let!(:a_page) { Factory(:page) }

  describe "GET 'show'" do
    it "returns http success" do
      visit "/#{a_page.title}"
      response.should be_success
    end
  end



end
