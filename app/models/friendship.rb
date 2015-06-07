class Friendship < ActiveRecord::Base
  belongs_to :from_user, class_name: User
  belongs_to :to_user, class_name: User

  validates :from_user, presence: true, uniqueness: { scope: :to_user_id }
  validates :to_user, presence: true, uniqueness: { scope: :from_user_id }

  def self.create_friendship(from_id, to_ids)
    return false if from_id.nil? || to_ids.nil?
    from_id = from_id.to_i if from_id.class == String

    ActiveRecord::Base.transaction do
      to_ids.each do |to_id|
        return false if from_id == to_id
        Friendship.new(from_user_id: from_id, to_user_id: to_id)
        Friendship.new(from_user_id: to_id, to_user_id: from_id)
      end
    end
    return true
  rescue => e
    return false, e
  end
end
