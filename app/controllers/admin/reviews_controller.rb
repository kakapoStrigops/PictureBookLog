class Admin::ReviewsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @reviews = Review.all.page(params[:page])
  end

  def show
    @review = Review.find(params[:id])
    @comments = Comment.where(review_id: @review.id)
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to admin_reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:hidden_status)
  end

end
