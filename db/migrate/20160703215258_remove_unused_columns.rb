class RemoveUnusedColumns < ActiveRecord::Migration
  def change
    remove_column :projects, :user_id
    rename_column :user_todos, :to_do_id, :todo_id
  end
end
