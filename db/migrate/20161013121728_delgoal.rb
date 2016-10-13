class Delgoal < ActiveRecord::Migration
  def change
    drop_table :user_goals
  end
end
