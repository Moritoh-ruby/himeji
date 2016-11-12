class CreateExcuses < ActiveRecord::Migration
  def change
    create_table :excuses do |t|
      t.integer :user_id
      t.string :excuse
      t.integer :endurance_id

      t.timestamps null: false
    end
  end
end
