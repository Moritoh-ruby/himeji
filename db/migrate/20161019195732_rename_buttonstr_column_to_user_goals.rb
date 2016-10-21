class RenameButtonstrColumnToUserGoals < ActiveRecord::Migration
  def change
   rename_column :user_goals, :buttonstr, :buttonStr
  end
end
