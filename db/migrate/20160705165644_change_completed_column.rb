class ChangeCompletedColumn < ActiveRecord::Migration
  def change
    rename_column :todos, :completed, :status
    change_column :todos, :status, :string
  end
end
