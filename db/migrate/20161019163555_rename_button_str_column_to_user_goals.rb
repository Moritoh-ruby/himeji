class RenameButtonStrColumnToUserGoals < ActiveRecord::Migration
  def change
    rename_column :user_goals, :buttonStr, :buttonstr
  end
end
