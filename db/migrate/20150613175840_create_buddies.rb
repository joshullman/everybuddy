class CreateBuddies < ActiveRecord::Migration
  def change
    create_table :buddies do |t|
      t.string :user_id
      t.string :buddy_id
      t.boolean :accepted, :default => false
    end
  end
end
