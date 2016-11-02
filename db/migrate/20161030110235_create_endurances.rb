class CreateEndurances < ActiveRecord::Migration
  def change
    create_table :endurances do |t|
      t.bigint :user_id
      t.string :endurance
      t.timestamps 
    end
  end
end
