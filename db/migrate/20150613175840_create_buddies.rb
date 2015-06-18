class CreateBuddies < ActiveRecord::Migration
  def change
    create_table :buddies do |t|
      t.integer :user_id
      t.integer :buddy_id
      t.boolean :accepted, :default => false
    end
  end
end
