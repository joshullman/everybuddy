require 'bcrypt'

class User < ActiveRecord::Base
	include BCrypt

  has_many :user_tags
  has_many :tags, -> {distinct}, through: :user_tags

  has_many :active_relationships, class_name: "Buddy",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :passive_relationships, class_name: "Buddy",
                                   foreign_key: "followed_id",
                                   dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower


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
