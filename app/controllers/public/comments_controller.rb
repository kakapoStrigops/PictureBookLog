class Public::CommentsController < ApplicationController

  before_action :authenticate_member!

  def create
    review = Review.find(params[:review_id])
    comment = current_member.comments.new(comment_params)
    comment.review_id = review.id
    comment.member_id = current_member.id
    if comment.save
      redirect_to review_path(review.id)
    else
      @review = Review.find_by(id: params[:review_id], hidden_status: false)
      @comments = Comment.where(review_id: review.id, hidden_status: false)
      @comment = Comment.new
      render template: "public/reviews/show"
    end
  end

  def destroy
    Comment.find_by(id: params[:id], member_id: current_member.id).destroy
    redirect_to review_path(params[:review_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
