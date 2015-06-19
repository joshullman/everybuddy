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

  has_many :buddy_relationships
  has_many :buddies, :through => :buddy_relationships

  def accepted_buddies
    id = self.id
    buddy_rels = BuddyRelationship.where("(buddy_relationships.user_id = #{id} OR buddy_relationships.buddy_id = #{id}) AND buddy_relationships.accepted = true")
    accepted_buddies = []
    buddy_rels.each do |buddy_rel|
      accepted_buddies << User.find(buddy_rel.user_id) if id != User.find(buddy_rel.user_id).id
      accepted_buddies << User.find(buddy_rel.buddy_id) if id != User.find(buddy_rel.buddy_id).id
    end
    return accepted_buddies
  end

  def pending_buddies
    id = self.id
    buddy_rels = BuddyRelationship.where("buddy_relationships.user_id = #{id} AND buddy_relationships.accepted = false")
    pending_buddies = []
    buddy_rels.each do |buddy_rel|
      pending_buddies << User.find(buddy_rel.buddy_id)
    end
    return pending_buddies
  end

  def buddy_requests
    id = self.id
    buddy_rels = BuddyRelationship.where("buddy_relationships.buddy_id = #{id} AND buddy_relationships.accepted = false")
    buddy_requests = []
    buddy_rels.each do |buddy_rel|
      buddy_requests << User.find(buddy_rel.user_id)
    end
    return buddy_requests
  end

  # def buddies(id)
  #   Buddy.where("buddies.user_id = #{id} OR buddies.buddy_id = #{id}").order(created_at: :desc)
  # end

  # has_many :buddies, class_name: "Buddy", source: :user, foreign_key: "user_id"
  # has_many :

  # has_many :authorized_friends, :through => :friendships, :source => :friend, :conditions => [ "authorized = ?", true ]
  # has_many :unauthorized_friends, :through => :friendships, :source => :friend, :conditions => [ "authorized = ?", false ]

  validates :name, :username, :email, :password, presence: true
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
