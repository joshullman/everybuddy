class CreateMessages < ActiveRecord::Migration
  def change
  	create_table :messages do |t|
      t.integer :messager_id
      t.integer :messaged_id

      t.timestamps null: false
    end
    add_index :messages, :messager_id
    add_index :messages, :messaged_id
    add_index :messages, [:messager_id, :messaged_id], unique: true
  end
end
