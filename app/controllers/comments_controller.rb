class CommentsController < ApplicationController



  def create
    @project = Project.find_by slug: params[:project_id]
    @issue = Issue.find_by slug: params[:issue_id]
    @comment = @issue.comments.build(params.require(:comment).permit(:body))
    @comment.creator = current_user
    @issue.reload
    if @comment.save
      flash[:notice]= 'You comment was added.'
         redirect_to project_issue_path(@project,@issue)
    else
      render '/issues/show'
    end
  end
  end