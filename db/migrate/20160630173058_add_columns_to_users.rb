class AddColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :username, :string
  	add_column :users, :user_type, :integer, default: 1
  end
end
