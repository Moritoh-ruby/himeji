class CreateExcuses < ActiveRecord::Migration
  def change
    create_table :excuses do |t|
      t.string :excuse
      t.integer :endurance_id
      t.integer :waste_money 
      t.timestamps null: false
    end
  end
end
