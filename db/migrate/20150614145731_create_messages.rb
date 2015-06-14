class CreateMessages < ActiveRecord::Migration
  def change
  	create_table :messages do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps null: false
    end
    add_index :buddies, :follower_id
    add_index :buddies, :followed_id
    add_index :buddies, [:follower_id, :followed_id], unique: true
  end
end
