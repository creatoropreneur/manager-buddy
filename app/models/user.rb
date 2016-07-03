class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects, dependent: :destroy

  has_many :user_todos, dependent: :destroy
  has_many :todos, through: :user_todos, dependent: :destroy

  enum user_type: { developer: 1, project_manager: 2 }

  def project_manager?
    self.user_type.to_sym.equal?(:project_manager)
  end

  def developer?
    self.user_type.to_sym.equal?(:developer)
  end
end
