class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total, :string
  end
end
