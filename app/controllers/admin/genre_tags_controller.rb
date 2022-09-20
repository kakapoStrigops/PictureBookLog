class Admin::GenreTagsController < ApplicationController

  before_action :authenticate_admin!

  def create
    @genre_tag = GenreTag.new(genre_tag_params)
    @genre_tag.save
    redirect_to admin_tags_path
  end

  def edit
    @genre_tag = GenreTag.find(params[:id])
  end

  def update
    @genre_tag = GenreTag.find(params[:id])
    if @genre_tag.update(genre_tag_params)
      redirect_to admin_tags_path
    else
      render :edit
    end
  end

  def destroy
    @genre_tag = GenreTag.find(params[:id])
    @genre_tag.destroy
    redirect_to admin_tags_path
  end

  private

  def genre_tag_params
    params.require(:genre_tag).permit(:genre)
  end

end
