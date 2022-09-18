class Admin::TagsController < ApplicationController
  def index
    @genre_tag = GenreTag.new
    @genre_tags = GenreTag.all
    @target_age_tag = TargetAgeTag.new
    @target_age_tags = TargetAgeTag.all
  end
end
