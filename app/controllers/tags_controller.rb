class TagsController < ApplicationController
  def index
    @tags = Tag.all
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save
    redirect_to tags_path
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:tag_type)
  end

end
