class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[ notice ] = 'Article has been created.'
      redirect_to articles_path
    else
      flash.now[ alert ] = 'Article has not been created.'
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
      flash[ notice ] = 'Article has been updated.'
      redirect_to article_path(@article)
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
