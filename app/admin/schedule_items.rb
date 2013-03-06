ActiveAdmin.register ScheduleItem do

  menu :label => "Schedule"

  config.sort_order = "start_asc"
  filter :start
  filter :end
  filter :name
  filter :info
  filter :location
  filter :geolocation
  filter :created_at
  filter :updated_at


  index do
    column "Start time", :start
    column "End Time", :end
    column :name
    column "Info", :short_info
    column :location
    column :geolocation
    column :created_at
    column :updated_at
    column :id
 
    default_actions
  end

  form do |f|
    f.inputs "Information" do
      f.input :name
      f.input :info, :label => "Description"
      f.input :location
      f.input :geolocation
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
      row :geolocation
    end


    active_admin_comments
  end

end
