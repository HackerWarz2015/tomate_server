class UserTask < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :difficulty, presence: true, inclusion: { in: [1, 3, 5] }
end
