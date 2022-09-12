class Public::CommentsController < ApplicationController
  def new
  end

  def create
    review = Review.find(params[:review_id])
    comment = current_member.comments.new(comment_params)
    comment.review_id = review.id
    comment.save
    redirect_to review_path(review.id)
  end

  def edit
  end

  def update
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
