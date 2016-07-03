class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.boolean :completed
      t.integer :order
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
