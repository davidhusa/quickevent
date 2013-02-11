class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :author
      t.string :title
      t.text :content
      t.boolean :is_published
      t.datetime :published_at

      t.timestamps
    end
  end
end
