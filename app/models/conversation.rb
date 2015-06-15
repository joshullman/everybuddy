class Conversation < ActiveRecord::Base
  belongs_to :user_one, class_name: "User"
  belongs_to :user_two, class_name: "User"
  has_many :messages
  # validates :user_one_id, presence: true
  # validates :user_two_id, presence: true
end
