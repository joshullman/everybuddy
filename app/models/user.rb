require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  validates :name, :username, :email, :password, presence: true
  validates :username, uniqueness: true
  validates :email, uniqueness: true

  has_many :user_tags
  has_many :tags, -> {distinct}, through: :user_tags

  ###########################################################################

  has_many :sent_convos, class_name: "Conversation", source: :user_one, foreign_key: "sender"
  has_many :received_convos, class_name: "Conversation", source: :user_two, foreign_key: "receiver"

  def conversations
    Conversation.where("conversations.sender = #{self.id} OR conversations.receiver = #{self.id}").order(created_at: :desc)
  end

  def conversations_with(id)
    Conversation.where("conversations.sender = #{self.id} AND conversations.receiver = #{id} OR 
                        conversations.sender = #{id} AND conversations.receiver = #{self.id}").order(created_at: :desc)
  end

  has_many :messages

  ##########################################################################

  has_many :buddy_relationships
  has_many :buddies, :through => :buddy_relationships

  def accepted_buddies
    buddy_rels = BuddyRelationship.where("(buddy_relationships.user_id = #{self.id} OR buddy_relationships.buddy_id = #{self.id}) AND buddy_relationships.accepted = true")
    accepted_buddies = []
    buddy_rels.each do |buddy_rel|
      accepted_buddies << User.find(buddy_rel.user_id) if self.id != User.find(buddy_rel.user_id).id
      accepted_buddies << User.find(buddy_rel.buddy_id) if self.id != User.find(buddy_rel.buddy_id).id
    end
    return accepted_buddies
  end

  def pending_buddies
    buddy_rels = BuddyRelationship.where("buddy_relationships.user_id = #{self.id} AND buddy_relationships.accepted = false")
    pending_buddies = []
    buddy_rels.each do |buddy_rel|
      pending_buddies << User.find(buddy_rel.buddy_id)
    end
    return pending_buddies
  end

  def buddy_requests
    buddy_rels = BuddyRelationship.where("buddy_relationships.buddy_id = #{self.id} AND buddy_relationships.accepted = false")
    buddy_requests = []
    buddy_rels.each do |buddy_rel|
      buddy_requests << User.find(buddy_rel.user_id)
    end
    return buddy_requests
  end

  ##########################################################################


  has_many :posted_events, class_name: "Event", source: :user_one, foreign_key: "poster"
  has_many :accepted_events, class_name: "Event", source: :user_two, foreign_key: "buddy"

  def events
    Event.where("events.poster = #{self.id} OR events.buddy = #{self.id}").order(created_at: :desc)
  end

  def events_with(id)
    Event.where("events.poster = #{self.id} AND events.buddy = #{id} OR 
                 events.poster = #{id} AND events.buddy = #{self.id}").order(created_at: :desc)
  end

  def public_events
    Event.where("events.poster = #{self.id} AND events.is_private = false OR 
                 events.buddy = #{self.id} AND events.is_private = false").order(created_at: :desc)
  end

  def private_events
    Event.where("events.poster = #{self.id} AND events.is_private = true OR 
                 events.buddy = #{self.id} AND events.is_private = true").order(created_at: :desc)
  end

  def accepted_events
    events = Event.where("(events.poster = #{self.id} OR events.buddy = #{self.id}) AND events.accepted = true")
  end

  def pending_events
    events = Event.where("events.poster = #{self.id} AND events.accepted = false")
  end

  def event_requests
    events = Event.where("events.buddy = #{self.id} AND events.accepted = false")
  end

  ##########################################################################
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
