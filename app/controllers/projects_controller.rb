class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    Project.create(project_params)
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end
end