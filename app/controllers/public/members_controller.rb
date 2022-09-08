class Public::MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
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

  def index
  end

  private

  def member_params
    params.require(:member).permit(:name, :name_kana, :nickname, :year_of_birth, :email)
  end

end
