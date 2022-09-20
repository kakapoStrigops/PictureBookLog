class Public::ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.save
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
    @parameter = params[:parameter]
    @keyword = params[:keyword]
    @reviews = Review.search_for(@parameter, @keyword).order(updated_at: "DESC")
    @reviews = @reviews.joins(:genre_tags).where(genre_tags: { id: params[:genre_tag_id] }).order(updated_at: "DESC") if params[:genre_tag_id].present?
    @reviews = @reviews.joins(:target_age_tags).where(target_age_tags: { id: params[:target_age_tag_id] }).order(updated_at: "DESC") if params[:target_age_tag_id].present?
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
    params.require(:review).permit(:member_id, :review, :hidden_status, :title, :author, :publisher, :date_of_publication, :isbn_code, :book_image_url, :rakuten_books_url, { genre_tag_ids: [] }, { target_age_tag_ids: [] })
  end

end
