class CreateEventTags < ActiveRecord::Migration
  def change
    create_table :event_tags do |t|
      t.integer  :user_id
      t.integer  :tag_id

      t.timestamps
    end
  end
end
