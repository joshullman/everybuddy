class Tag < ActiveRecord::Base
  validates :name, uniqueness: true
  
  has_many :event_tags
  has_many :events, -> {distinct}, through: :event_tags
end
