ActiveAdmin.register ScheduleItem do

  menu :label => "Schedule"

  config.sort_order = "start_asc"

  index do
    column "Start time", :start
    column "End Time", :end
    column :name
    column "Info", :short_info
    column :location
    column :id
    column :created_at
    column :updated_at
 
    default_actions
  end

  form do |f|
    f.inputs "Information" do
      f.input :name
      f.input :info, :label => "Description"
      f.input :geolocation, :label => "Location"
    end
    f.inputs "Time" do
      f.input :start
      f.input :end
    end

    f.buttons
  end

  show do |item| 

    attributes_table do
      row :name
      row :start_time do
        item.start
      end
      row :end_time do
        item.end
      end
      row :id
      row :info do
        simple_format item.info
      end
    end

    attributes_table do
      row :location
      row "Map location" do
        image_tag "http://maps.googleapis.com/maps/api/staticmap?" +
          "center=#{item.geolocation.latitude},#{item.geolocation.longitude}" +
          "&zoom=15&size=400x400" +
          "&markers=color:red%7C#{item.geolocation.latitude},#{item.geolocation.longitude}" + 
          "&sensor=false" if item.geolocation.longitude && item.geolocation.latitude
      end
    end


    active_admin_comments
  end

end
