require 'bcrypt'

class User < ActiveRecord::Base
	include BCrypt

  has_many :user_tags
  has_many :tags, -> {distinct}, through: :user_tags

  has_many :active_relationships, class_name: "Message",
                                  foreign_key: "messager_id",
                                  dependent: :destroy
  has_many :passive_relationships, class_name: "Message",
                                   foreign_key: "messaged_id",
                                   dependent: :destroy
  has_many :messaging, through: :active_relationships, source: :messaged
  has_many :messagers, through: :passive_relationships, source: :messager

  has_many :buddies
  has_many :buddys, :through => :buddies
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
