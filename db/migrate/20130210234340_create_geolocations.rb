class CreateGeolocations < ActiveRecord::Migration
  def change
    create_table :geolocations do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :name
      t.text :info

      t.timestamps
    end
  end
end
