class Public::MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
  end

  def edit
  end

  def update
  end

  def index
  end
end