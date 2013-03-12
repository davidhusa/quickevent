ActiveAdmin.register News do
  config.sort_order = "published_at_desc"
  filter :title
  filter :author
  filter :content
  filter :is_published, :as => :select
  filter :published_at
  filter :created_at
  filter :updated_at

  index do 
    column :title
    column "Published?", :is_published
    column :author
    column "Content", :short_content
    column :published_at
    column :created_at
    column :updated_at
    column :id
    default_actions
  end

  show do |post|
    attributes_table do
      row :title
      row :author
      row :is_published
      row :published_at
      row :created_at
      row :updated_at
      row :id
      row :content do
        simple_format post.content
      end
    end

    active_admin_comments
  end

  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :author
      f.input :is_published, :label => "Publish this post now?"
    end
    f.inputs "Content" do
      f.input :content
    end
    f.actions
  end

end
