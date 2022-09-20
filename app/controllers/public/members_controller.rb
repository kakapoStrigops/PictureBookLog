class Public::MembersController < ApplicationController

  def show
    @member = Member.find(params[:id])
    @consideration_count = CandidatePost.where(member_id: @member.id, consideration_status: 0).count
    @candidate_posts = CandidatePost.where(member_id: @member.id, consideration_status: 0).order(updated_at: "DESC").limit(3)
    @reviews = Review.where(member_id: @member.id).order(updated_at: "DESC")
  end

  def edit
    @member = Member.find(current_member.id)
  end

  def update
    @member = Member.find(current_member.id)
    if @member.update(member_params)
      redirect_to member_path(@member.id)
    else
      render :edit
    end
  end

  private

  def member_params
    params.require(:member).permit(:name, :name_kana, :nickname, :year_of_birth, :email, :self_introduction, :profile_image)
  end

end
