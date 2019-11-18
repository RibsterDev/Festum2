class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date_start
      t.date :date_end
      t.string :address
      t.string :category
      t.string :sub_category
      t.string :photo_url
      t.float :lat
      t.float :long
      t.text :description
      t.string :event_url

      t.timestamps
    end
  end
end
