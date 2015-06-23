class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer  :conversation_id
      t.integer  :user_id
      t.string   :content
      t.boolean  :read, default: false

      t.timestamps null: false
    end
  end
end
