class Public::ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.save
    # redirect_to edit_review_path(@review.id)
    redirect_to new_review_path(@review.id)
  end

  def new
    @review = Review.find(params[:id])
  end

  def post
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to reviews_path
  end

  def index
    @reviews = Review.where(hidden_status: false)
    @hidden_reviews = Review.where(hidden_status: true, member_id: current_member.id)
  end

  def show
    @review = Review.find(params[:id])
  end

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to reviews_path
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:member_id, :review, :hidden_status, :title, :author, :publisher, :date_of_publication, :isbn_code, :book_image_url, :rakuten_books_url)
  end

end
