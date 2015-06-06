class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :title
      t.integer :required_steps
      t.boolean :is_public
      t.datetime :released_at
      t.datetime :done_at

      t.timestamps null: false
    end
  end
end
