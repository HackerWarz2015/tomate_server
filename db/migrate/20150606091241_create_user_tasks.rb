class CreateUserTasks < ActiveRecord::Migration
  def change
    create_table :user_tasks do |t|
      t.integer :user_id
      t.string :title
      t.integer :difficulty
      t.integer :steps
      t.boolean :is_must
      t.datetime :failure_at
      t.datetime :done_at

      t.timestamps null: false
    end
  end
end
