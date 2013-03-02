ActiveAdmin.register Page do

  config.sort_order = "title_desc"

  index do
    column "Title/URL", :title
    column "Content", :short_content
    column :created_at
    column :updated_at
    column :id
    default_actions
  end

  show do |page|
    attributes_table  do
      row :title
      row :id
      row :content do
        simple_format page.content
      end
    end

    active_admin_comments
  end

  
end
