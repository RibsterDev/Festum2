class AddEmailToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :email, :string
  end
end
