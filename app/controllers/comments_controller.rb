class CommentsController < ApplicationController
  before_action :find_article

  def create
		@comment = @article.comments.create(params[:comment].permit(:name, :body))

    flash[:notice] = 'Comment has been created.'
		redirect_to article_path(@article)
	end

  def destroy
		@comment = @articl.comments.find(params[:id])
		@comment.destroy

		redirect_to post_path(@post)
	end

  private

  def comment_params
    params.require(:comment).permit(:name, :content)
  end

  def find_article
    @article = Article.find(params[:article_id])
  end
end
