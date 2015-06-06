class RemoveIsMustToUserTasks < ActiveRecord::Migration
  def change
    remove_column :user_tasks, :is_must
  end
end
