class CreateConversations < ActiveRecord::Migration
  def change
  	create_table :conversations do |t|
      t.integer  :sender
      t.integer  :receiver
      t.string   :title

      t.timestamps null: false
    end
  end
end
