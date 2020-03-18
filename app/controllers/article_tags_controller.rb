class ArticleTagsController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @tags = Tag.all.map { |tag| tag.tag_type }
    @article_tag = ArticleTag.new
  end

  def create
    @article = Article.find(params[:article_id])
    selected_tags = params[:article_tag][:tag]
    selected_tags.shift
    selected_tags.each do |tag_string|
      @tag = Tag.where(tag_type: tag_string).first
      @article_tag = ArticleTag.new(tag: @tag)
      @article_tag.article = @article
      @article_tag.save
    end
    redirect_to article_path(@article)
  end

  private

  def article_tag_params
    params.require(:article_tag).permit(:tag, :article)
  end
end
