class AddLmitAtToUserTasks < ActiveRecord::Migration
  def change
    add_column :user_tasks, :limit_at, :datetime
  end
end
