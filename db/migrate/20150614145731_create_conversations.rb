class CreateConversations < ActiveRecord::Migration
  def change
  	create_table :conversations do |t|
      t.integer :user_one_id
      t.integer :user_two_id
      t.string :title

      t.timestamps null: false
    end
  end
end
