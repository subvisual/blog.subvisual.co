class PostsController < ApplicationController
  decorates_assigned :category, :posts, :post

  def index
    @posts = Post.published.recent
  end

  def feed
    if params[:category]
      @category = Category.from_param(params[:category])
      @posts = @posts.by_category(@category).recent
    else
      @posts = Post.published.recent
    end

    respond_to do |format|
      format.rss { render layout: false }
    end
  end

  def show
    @post = Post.find(params[:id])
    authorize! :read, @post
  end

  private

  def post_params
    params[:post]
  end
end
