class Message < ActiveRecord::Base
  belongs_to :messager, class_name: "User"
  belongs_to :messaged, class_name: "User"
  validates :messager_id, presence: true
  validates :messaged_id, presence: true
end