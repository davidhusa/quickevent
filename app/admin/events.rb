ActiveAdmin.register Event do

  index do
    column :title
    column :start
    column :end
    column "Description", :short_description
    column :twitter_hashtag
    column :created_at
    column :updated_at
    column :id
    default_actions
  end


  
end
