class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :organizer
      t.text :description
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
