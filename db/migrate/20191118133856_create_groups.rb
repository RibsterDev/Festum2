class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :location
      t.date :date_event
      t.integer :vote_duration
      t.integer :proposition_duration

      t.timestamps
    end
  end
end
