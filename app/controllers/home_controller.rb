class HomeController < ApplicationController

  def dashboard
    @users = User.developer
    @todos = Todo.all
  end
end
