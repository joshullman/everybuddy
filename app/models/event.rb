class Event < ActiveRecord::Base
  belongs_to :user_one, class_name: "User"
  belongs_to :user_two, class_name: "User"

  def poster
  	User.find(self.poster_id)
  end

  def receiver
  	User.find(self.receiver_id)
  end
end
