class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit,:update]

  def index
    @projects = Project.all
  end

  def show

    @issue = Issue.new
  end

  def new
    @project = Project.new

  end

  def create
    @project = Project.new(project_params)
    @project.creator = current_user

    if @project.save
      flash[:notice] = "The new project was created"
      redirect_to projects_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @project.update(project_params)
      flash[:notice]= "This Project was updated."
      redirect_to project_path(@project)
    else
      render :edit
    end
  end


  private


  def project_params
    params.require(:project).permit(:name,:url)

  end

  def set_project
    @project = Project.find_by slug: params[:id]
  end




end


