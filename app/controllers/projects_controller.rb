class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  before_action :load_projects, only: :index
  def index
  end
  def new
    @project = Project.new
  end
  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
    else
      flash.now[:alert] = "Project has not been created."
      render "new"
    end
  end
  def show

  end
  def edit
    
  end
  def update

    if @project.update(project_params)
      flash[:notice] = "Project has been updated."
      redirect_to @project
    else
      flash.now[:alert] = "Project has not been updated."
      render "edit"
    end

  end

  def destroy
    if @project.destroy
      flash[:notice] = "Project has been deleted."
      redirect_to projects_path
    else
      flash.now[:alert] = "You can't delete this project"
      redirect_to projects_path
    end
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end
  def load_projects
    @projects = Project.all
  end
  def project_params
    params.require(:project).permit(:name,:description)
  end
end