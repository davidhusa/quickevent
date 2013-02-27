require 'spec_helper'


feature 'route unclaimed page namespace to pages with matching title' do
  let!(:a_page) { Factory(:page) }

  scenario "going to a valid page returns success" do
    visit "/#{a_page.title}"
    page.should have_content(a_page.content)
  end

end
