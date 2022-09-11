class Admin::TagsController < ApplicationController
  def index
    @genre_tags = GenreTag.all
    @target_age_tags = TargetAgeTag.all
  end
end
