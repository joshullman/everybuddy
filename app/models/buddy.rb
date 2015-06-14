class Buddy < ActiveRecord::Base
  belongs to :follower, class_name: "User"
  belongs to :followed, class_name: "User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
