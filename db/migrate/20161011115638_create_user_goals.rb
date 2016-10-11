class CreateUserGoals < ActiveRecord::Migration
  def change
    create_table :user_goals do |t|
      t.integer :user_id
      t.string :buttonStr
      t.integer :goalMoney
      t.integer :goalMoney
      t.integer :total
      t.boolean :finish

      t.timestamps null: false
    end
  end
end
