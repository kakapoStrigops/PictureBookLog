class Public::MembersController < ApplicationController

  before_action :authenticate_member!
  before_action :ensure_guest_member, only: [:edit]

  def show
    @member = Member.find(params[:id])
    @consideration_count = CandidatePost.extract(@member, 0).count
    @candidate_posts = CandidatePost.extract(@member, 0).recent(3)
    @review = Review.new
    @reviews = Review.where(member_id: @member.id).order(updated_at: "DESC") if current_member == @member
    @reviews = Review.where(member_id: @member.id).displayable.order(updated_at: "DESC") if current_member != @member
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

  def ensure_guest_member
    @member = Member.find(params[:id])
    if @member.email == "guest@example.com"
      redirect_to member_path(current_member), notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
