class AddEventAssociationToEverything < ActiveRecord::Migration
  def change
    add_column :schedule_items, :event_id, :integer
    add_index :schedule_items, :event_id

    add_column :admin_users, :event_id, :integer
    add_index :admin_users, :event_id

    add_column :news, :event_id, :integer
    add_index :news, :event_id

    add_column :geolocations, :event_id, :integer
    add_index :geolocations, :event_id

    add_column :pages, :event_id, :integer
    add_index :pages, :event_id

  end
end
