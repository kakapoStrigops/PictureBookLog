class Admin::CommentsController < ApplicationController

  before_action :authenticate_admin!

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to admin_review_path(@comment.review_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:hidden_status)
  end

end
