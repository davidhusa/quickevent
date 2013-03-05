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
        panel "Published News" do
          ul do
            News.order(:published_at).where("is_published = ?", true).map do |post|
              li link_to(post.title, admin_news_path(post))
            end
          end
        end
        panel "Unpublished News" do
          ul do
            News.order(:created_at).where("is_published = ?", false).map do |post|
              li link_to(post.title, admin_news_path(post))
            end
          end
        end
      end
      column do
        panel "Recent changes" do
          ul do
            (News.all + ScheduleItem.all + Page.all + Geolocation.all).sort! { |x,y|
              y.updated_at <=> x.updated_at }.each_with_index do |thing, i|
                case thing.class.to_s
                when "Geolocation"
                  @path = "geolocations"
                when "ScheduleItem"
                  @path = "schedule_items"
                when "News"
                  @path = "news"
                when "Page"
                  @path = "pages"
                end
                  
                li link_to( thing.title, "/admin/#{@path}/#{thing.id}") +" (#{thing.class})"
                div "#{pretty_time thing.updated_at} on #{pretty_quick_date thing.updated_at}"
              
                break if i>4
              end
          end
        end
      end
    end

  end 
end
