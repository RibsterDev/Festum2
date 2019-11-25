class AddSortToVote < ActiveRecord::Migration[5.2]
  def change
    add_column :votes, :sort, :integer
  end
end
