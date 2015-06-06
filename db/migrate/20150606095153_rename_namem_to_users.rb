class RenameNamemToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :namem, :name
  end
end
