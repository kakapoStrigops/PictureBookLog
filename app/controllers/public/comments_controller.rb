class Public::CommentsController < ApplicationController

  before_action :authenticate_member!

  def create
    review = Review.find(params[:review_id])
    comment = current_member.comments.new(comment_params)
    comment.review_id = review.id
    comment.member_id = current_member.id
    comment.save
    redirect_to review_path(review.id)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to review_path(params[:review_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
