class TodosController < ApplicationController
  before_filter :find_project, :random_slowdown

  respond_to :json

  # GET /api/lists/:list_id/todos
  def index
    respond_with @project.todos
  end

  # POST /api/lists/:list_id/todos
  def create
    todo_assigned
    respond_with @project, @project.todos.create!(todo_params)
  end

  # GET /api/lists/:list_id/todos/:id
  def show
    respond_with @project.todos.find(params[:id])
  end

  # PUT/PATCH /api/lists/:list_id/todos/:id
  def update
    respond_with @project, @project.todos.find(params[:id]).update_attributes!(todo_params)
  end

  # DELETE /api/lists/:list_id/todos/:id
  def destroy
    respond_with @project, @project.todos.find(params[:id]).destroy!
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end

  # Randomly pause for somewhere between 0-2 seconds
  def random_slowdown
    sleep rand(0..2000) / 1000.0
  end
  # Only allow a trusted parameter "white list" through.
  def todo_params
    params.permit(:title, :order, :completed)
  end

  def todo_assigned
    username = params[:title][/.@([^>]*)/,1].gsub("@", "").split(/[\s,']/)
    users = []
    username.each do |un|
      user = User.find_by(username: un)
      users << user
    end
    users.each do |user|
      user.user_todos.create(user_id: user.id, todo_id: params[:todo_id])
    end
  end
end
