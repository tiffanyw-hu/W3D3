class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.integer :visitor_id, null: false,
      t.integer :user_id, null: false,
      t.timestamps
    end
  end
end
