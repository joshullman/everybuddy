class Conversation < ActiveRecord::Base
  belongs_to :user_one, class_name: "User"
  belongs_to :user_two, class_name: "User"
  has_many :messages
end
