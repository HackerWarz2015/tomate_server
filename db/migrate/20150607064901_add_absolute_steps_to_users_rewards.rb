class AddAbsoluteStepsToUsersRewards < ActiveRecord::Migration
  def change
    add_column :users_rewards, :absolute_steps, :integer
  end
end
