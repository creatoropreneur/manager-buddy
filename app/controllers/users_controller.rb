class UsersController < ApplicationController

  respond_to :json

  def index
    @users = User.developer
  end
end