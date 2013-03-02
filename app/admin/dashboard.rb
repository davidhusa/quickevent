ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => "Quick Event App" do

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Welcome" do
          para "Welcome to the Quick Event App content editor. "  +
            "Click on the tabs above to fill out your app's content."
          para "Configure your Event's name, description, start time, end time, Twitter hashtag, and other info in the Event tab."
          para "Highlight important places in the vicinity of your event in the Geolocations tab."
          para "Post information to your app's built-in blog on the News tab."
          para "Create your event's itinerary on the Schedule tab."
        end
      end
      column do
        panel "News" do
          ul do
            News.all.map do |post|
              li link_to(post.title, admin_news_path(post))
            end
          end
        end
      end
    end

  end 
end
