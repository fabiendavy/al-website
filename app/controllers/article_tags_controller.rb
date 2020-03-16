class ArticleTagsController < ApplicationController
  def create
    @article = Article.find[:article_id]
    @article_tag = ArticleTag.new(article_params)
  end

  private

  def article_params
    params.require(:article).permit(:article_id)
  end
end
