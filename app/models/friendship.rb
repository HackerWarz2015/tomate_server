class Friendship < ActiveRecord::Base
  belongs_to :from_user, class_name: User
  belongs_to :to_user, class_name: User

  validates :from_user, presence: true, uniqueness: { scope: :from_user_id }
  validates :to_user, presence: true, uniqueness: { scope: :to_user_id }
end

