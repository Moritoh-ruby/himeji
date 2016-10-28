class ChangeUserIdToUserGoals < ActiveRecord::Migration
  def change
  change_column :user_goals, :user_id, :bigint
  end
end
