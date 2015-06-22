class CreateEvents < ActiveRecord::Migration
  def change
  	create_table :events do |t|
      t.integer  :user_one_id
      t.integer  :user_two_id
      t.string   :name
      t.string   :time
      t.string   :location

      t.timestamps null: false
    end
  end
end
