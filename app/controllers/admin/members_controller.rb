class Admin::MembersController < ApplicationController

  def index
    @members = Member.page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
  end
end
