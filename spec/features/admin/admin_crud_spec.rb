require 'spec_helper'

feature "managing data on active admin" do
  let! (:admin) { Factory(:admin_user) }
  before do
    visit '/admin/login'
    fill_in "Email", :with => admin.email
    fill_in "Password", :with => "password"
    click_button "Login"
  end

  scenario "can create news post" do

    click_link "News" #Doesn't work, gives error saying click_link can only take 0 arguments WTFFFFFFF
    #visit '/admin/news'

    click_link "New News"
    fill_in "Author", :with => "test man"
    fill_in "Title", :with => "test title"
    fill_in "Author", :with => "Zip zop zoobita bop jello pudding jazz etc."
    check "Is published"
    page.select '2013', :from => "news[published_at(1i)]"
    page.select 'January', :from => "news[published_at(2i)]"
    page.select '3', :from => "news[published_at(3i)]"
    page.select '10', :from => "news[published_at(4i)]"
    page.select '30', :from => "news[published_at(5i)]"

    click_button "Create News"

    response.should redirect_to('admin/news#show')
    page.should have_content("News was successfully created.")

    page.should have_content("test title")
    
  end
end