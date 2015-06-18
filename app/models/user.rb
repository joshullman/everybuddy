require 'bcrypt'

class User < ActiveRecord::Base
	include BCrypt

  has_many :user_tags
  has_many :tags, -> {distinct}, through: :user_tags

  has_many :sent_convos, class_name: "Conversation", source: :user_one, foreign_key: "sender"
  has_many :received_convos, class_name: "Conversation", source: :user_two, foreign_key: "receiver"

  def conversations(id)
    Conversation.where("conversations.sender = #{id} OR conversations.receiver = #{id}").order(created_at: :desc)
  end

  has_many :messages

  has_many :buddies
  has_many :buddys, :through => :buddies
  has_many :inverse_buddies, :class_name => "Buddy", :foreign_key => "buddy_id"
  has_many :inverse_buddys, :through => :inverse_buddies, :source => :user

  # def buddies(id)
  #   Buddy.where("buddies.user_id = #{id} OR buddies.buddy_id = #{id}").order(created_at: :desc)
  # end

  # has_many :buddies, class_name: "Buddy", source: :user, foreign_key: "user_id"
  # has_many :

  # has_many :authorized_friends, :through => :friendships, :source => :friend, :conditions => [ "authorized = ?", true ]
  # has_many :unauthorized_friends, :through => :friendships, :source => :friend, :conditions => [ "authorized = ?", false ]

  validates :first_name, :last_name, :username, :email, :password, presence: true
  validates :username, uniqueness: true
  validates :email, uniqueness: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

	# def create
 #    @user = User.new(params[:user])
 #    @user.password = params[:password]
 #    @user.save!
 #  end

  # def login
  #   @user = User.find_by_email(params[:email])
  #   if @user.password == params[:password]
  #     give_token
  #   else
  #     redirect_to home_url
  #   end
  # end

end
