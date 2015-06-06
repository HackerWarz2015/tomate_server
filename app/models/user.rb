class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_tasks
  has_many :users_rewards, dependent: :destroy
  has_many :rewards, through: :users_rewards
  has_many :friendship_of_from_user, class_name: Friendship, foreign_key: :from_user_id, dependent: :destroy
  has_many :friendship_of_to_user, class_name: Friendship, foreign_key: :to_user_id, dependent: :destroy
  has_many :friends_of_from_user, through: :friendship_of_from_user, source: :to_user
  has_many :friends_of_to_user, through: :friendship_of_to_user, source: :from_user

  validates :authentication_token, uniqueness: true, allow_nil: true

  def ensure_authentication_token
    self.authentication_token || generate_authentication_token
  end

  def generate_authentication_token
    loop do
      old_token = self.authentication_token
      token = SecureRandom.urlsafe_base64(24).tr('lIO0', 'sxyz')
      break token if (self.update!(authentication_token: token) rescue false) && old_token != token
    end
  end

  def delete_authentication_token
    self.update(authentication_token: nil)
  end
end
