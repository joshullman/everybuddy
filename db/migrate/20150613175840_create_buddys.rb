class CreateBuddys < ActiveRecord::Migration
  def change
    create_table :buddys do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps null: false
    end
    add_index :buddys, :follower_id
    add_index :buddys, :followed_id
    add_index :buddys, [:follower_id, :followed_id ], unique: true
  end
end
