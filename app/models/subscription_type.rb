class SubscriptionType < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true 
  has_many :trips
end
