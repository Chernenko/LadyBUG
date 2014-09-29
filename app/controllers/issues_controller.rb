class IssuesController < ApplicationController
  before_action :set_project
  before_action :set_issue, only: [:show, :edit, :update,:screenshot ]

  def new
    @issue = Issue.new

  end

  def create

    @issue = @project.issues.build(params.require(:issue).permit(:title,:description,:severity_id,:priority_id,:state_id,:user_id,:image))
    @issue.creator = current_user
    @project.reload
    if @issue.save
      flash[:notice] = 'New Issue was created .'
      redirect_to projects_path
    else
      render :new
    end
  end



  def show
    @comment = Comment.new
  end

  def update
    if @issue.update(issue_params)
      flash[:notice]= "This Issue was updated."
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def edit;end

  def set_issue
    @issue = Issue.find_by slug: params[:id]
  end

  def set_project
    @project = Project.find_by slug: params[:project_id]

  end

  def issue_params
    params.require(:issue).permit(:title,:description,:severity_id,:priority_id,:state_id,:user_id,:image)
  end

  def screenshot;end

end
