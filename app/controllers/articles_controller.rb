class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_article, only: [ :show, :edit, :update ]

  def index
    @articles = Article.all
  end

  def show
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
      # redirect_to article_path(@article)
      redirect_to new_article_article_tag_path(@article)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @article.reading_time = ((@article.content.body.to_plain_text.split(' ').count) / 200.0).round
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :image_url, :content)
  end

  def set_initials(username)
    words = username.split(/\W/)
    initials = words.map { |word| word[0] }
    initials.join('')
  end
end
