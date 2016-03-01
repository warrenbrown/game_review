class ArticlesController < ApplicationController

  before_action :set_article, only:[ :show, :edit, :update, :destroy ]

  def index
    @articles = Article.all
    @featured = Article.where(is_featured: true)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[ :notice ] = 'Article has been created.'
      redirect_to articles_path
    else
      flash.now[ :alert ] = 'Article has not been created.'
      render 'new'
    end
  end

  def show
    @featured = Article.where(is_featured: true)
  end

  def edit

  end

  def update
    if @article.update(article_params)
      flash[ :notice ] = 'Article has been updated.'
      redirect_to article_path(@article)
    else
      flash.now[ :alert ] = 'Article has not been updated.'
      render 'edit'
    end
  end

  def destroy
    @article.destroy

    flash[ :alert ] = 'Article has been deleted.'
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :article_img,:is_featured)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
