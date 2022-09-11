class Public::ReviewsController < ApplicationController
  def new
  end

  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to edit_review_path(@review.id)
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to reviews_path
  end

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end


  private

  def review_params
    params.require(:review).permit(:member_id, :review, :hidden_status, :title, :author, :publisher, :date_of_publication, :isbn_code, :book_image_url, :rakuten_books_url)
  end

end
