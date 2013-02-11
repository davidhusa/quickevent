class CreateScheduleItems < ActiveRecord::Migration
  def change
    create_table :schedule_items do |t|
      t.datetime :start
      t.datetime :end
      t.string :name
      t.text :info
      t.references :geolocation
      t.string :location
      t.string :map_url

      t.timestamps
    end
    add_index :schedule_items, :geolocation_id
  end
end
