ActiveAdmin.register Geolocation do
  config.sort_order = "name_asc"

  #scope_to current_user.event

  index do
    column :name
    column "Info", :short_info
    column :address
    column :latitude
    column :longitude
    column :created_at
    column :updated_at
    column :id
    default_actions
  end

  
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :info
    end
    f.inputs "Address" do
      f.input :address, :label => "Full address"
    end
    f.buttons
  end

  show  do |location|
    attributes_table  do
      row :name
      row :id
      row :info do
        simple_format location.info
      end
    end
    attributes_table do
      row :address
      row :latitude
      row :longitude
      row :preview do
        image_tag "http://maps.googleapis.com/maps/api/staticmap?" +
          "center=#{location.latitude},#{location.longitude}" +
          "&zoom=15&size=400x400" +
          "&markers=color:red%7C#{location.latitude},#{location.longitude}" + 
          "&sensor=false" if location.longitude && location.latitude
      end

    end

    active_admin_comments
  end

end
