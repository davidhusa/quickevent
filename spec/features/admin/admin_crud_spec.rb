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

    click_link "News"

    click_link "New News"
    fill_in "Author", :with => "test man"
    fill_in "Title", :with => "test title"
    fill_in "Content", :with => "Zip zop zoobita bop jello pudding jazz etc."
    check "Publish this post now?"

    click_button "Create News"

    page.should have_content("News was successfully created.")

    page.should have_content("test title")

    news = News.where("title = 'test title'").first

    news.author.should == "test man"
    
  end
end