class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @initials = set_initials(@article.author.username)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.author = current_user
    @article.reading_time = ((@article.content.body.to_plain_text.split(' ').count) / 200.0).round
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :image_url, :content)
  end

  def set_initials(username)
    words = username.split(/\W/)
    initials = words.map { |word| word[0] }
    initials.join('')
  end
end
