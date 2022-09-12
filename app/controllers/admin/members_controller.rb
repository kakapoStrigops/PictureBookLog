class Admin::MembersController < ApplicationController

  def index
    @members = Member.page(params[:page])
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to admin_member_path(@member.id)
    else
      render "edit"
    end
  end

  private

  def member_params
    params.require(:member).permit(:name, :name_kana, :nickname, :year_of_birth, :email, :self_introduction, :profile_image, :delete_status)
  end

end
