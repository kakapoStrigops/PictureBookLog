class Public::CandidatePostsController < ApplicationController

  def create
    @candidate_post = CandidatePost.new(candidate_post_params)
    @candidate_post.save
    redirect_to candidate_posts_path
  end

  def index
    @candidate_posts = CandidatePost.where(member_id: current_member.id)
  end

  def update
  end

  private

  def candidate_post_params
    params.require(:candidate_post).permit(:member_id, :isbn_code, :consideration_status, :memo)
  end

end
