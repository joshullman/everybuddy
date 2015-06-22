class CreateBuddyRelationships < ActiveRecord::Migration
  def change
    create_table :buddy_relationships do |t|
      t.integer  :user_id
      t.integer  :buddy_id
      t.boolean  :accepted, default: false
    end
  end
end
