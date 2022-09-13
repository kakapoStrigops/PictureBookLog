class Admin::CommentsController < ApplicationController

  def index
    @comments = Comment.all.page(params[:page]).per(20)
  end

  def show
    @comment = Comment.find(params[:comment_id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update

  end

end
