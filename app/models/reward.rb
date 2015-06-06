class Reward < ActiveRecord::Base
  has_many :users_rewards, dependent: :destroy
  has_many :users, through: :users_rewards
end
