class ChangeInvalidDb < ActiveRecord::Migration
  def change
    change_column_null :user_goals, :finish, false
    change_column_default :user_goals, :finish, false
  end
end
