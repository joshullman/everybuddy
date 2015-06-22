class CreateEvents < ActiveRecord::Migration
  def change
  	create_table :events do |t|
      t.integer  :poster
      t.integer  :buddy
      t.string   :name
      t.string   :time
      t.string   :location

      t.timestamps null: false
    end
  end
end
