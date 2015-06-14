class Tag < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :user_tags
  has_many :users, -> {distinct}, through: :user_tags
end
