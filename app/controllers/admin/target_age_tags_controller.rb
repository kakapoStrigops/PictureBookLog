class Admin::TargetAgeTagsController < ApplicationController

  def create
    @target_age_tag = TargetAgeTag.new(target_age_tag_params)
    @target_age_tag.save
    redirect_to admin_tags_path
  end

  def edit
    @target_age_tag = TargetAgeTag.find(params[:id])
  end

  def update
    @target_age_tag = TargetAgeTag.find(params[:id])
    if @target_age_tag.update(target_age_tag_params)
      redirect_to admin_tags_path
    else
      render :edit
    end
  end

  def destroy
    @target_age_tag = TargetAgeTag.find(params[:id])
    @target_age_tag.destroy
    redirect_to admin_tags_path
  end

  private

  def target_age_tag_params
    params.require(:target_age_tag).permit(:target_age)
  end

end
