class CreateEvents < ActiveRecord::Migration
  def change
  	create_table :events do |t|
      t.integer  :poster_id
      t.integer  :receiver_id, default: 0
      t.integer  :tag_id
      t.string   :name
      t.string   :time
      t.string   :location
      t.boolean  :accepted, default: false
      t.boolean  :is_private, default: false

      t.timestamps null: false
    end
  end
end
