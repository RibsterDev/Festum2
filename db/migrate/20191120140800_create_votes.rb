class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.references :user, foreign_key: true
      t.references :event_user, foreign_key: true

      t.timestamps
    end
  end
end
