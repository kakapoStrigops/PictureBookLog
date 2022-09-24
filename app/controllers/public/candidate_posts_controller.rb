class Public::CandidatePostsController < ApplicationController

  before_action :authenticate_member!

  def create
    @candidate_post = CandidatePost.new(candidate_post_params)
    @candidate_post.save
    redirect_to candidate_posts_path
  end

  def index
    @candidate_posts = CandidatePost.where(member_id: current_member.id).order(updated_at: "DESC")
    @candidate_posts = CandidatePost.extract(current_member, params[:consideration_status]).order(updated_at: "DESC") if params[:consideration_status].present?
    @review = Review.new
  end

  def update
    @candidate_post = CandidatePost.find(params[:id])
    if @candidate_post.update(candidate_post_params)
     redirect_to candidate_posts_path
    else
     render :index
    end
  end

  def destroy
    @candidate_post = CandidatePost.find(params[:id])
    @candidate_post.destroy
    redirect_to candidate_posts_path
  end

  private

  def candidate_post_params
    params.require(:candidate_post).permit(:member_id, :consideration_status, :memo, :title, :author, :publisher, :date_of_publication, :isbn_code, :book_image_url, :rakuten_books_url)
  end

end