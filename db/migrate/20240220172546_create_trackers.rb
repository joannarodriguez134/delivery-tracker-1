class CreateTrackers < ActiveRecord::Migration[7.0]
  def change
    create_table :trackers do |t|
      t.integer :user_id
      t.boolean :delivery_status
      t.string :description
      t.date :supposed_to_arrive_on
      t.text :details

      t.timestamps
    end
  end
end
