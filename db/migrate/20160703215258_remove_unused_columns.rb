class RemoveUnusedColumns < ActiveRecord::Migration
  def change
    rename_column :user_todos, :to_do_id, :todo_id
  end
end
