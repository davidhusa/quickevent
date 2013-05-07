require 'spec_helper'


feature 'route unclaimed page namespace to pages with matching title' do
  let!(:event) { Factory(:event) }
  let!(:a_page) { Factory(:page) }
  before do
    a_page.event_id = event.id
    a_page.save
  end

  scenario "going to a valid page returns success" do

    visit "/#{event.url}/#{a_page.title}"
    page.should have_content(a_page.content)
  end

end
