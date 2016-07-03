class Todo < ActiveRecord::Base
  belongs_to :project
  has_many :user_todos, dependent: :destroy
  has_many :users, through: :user_todos, dependent: :destroy
end
