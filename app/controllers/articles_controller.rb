class ArticlesController < ApplicationController
  def index
    @articles = Article.all    
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.author = current_user
    @article.reading_time = ((@article.content.body.to_plain_text.split(' ').count) / 200.0).round
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :image_url, :content)
  end
end
