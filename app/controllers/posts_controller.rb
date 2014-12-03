class PostsController < ApplicationController
  POSTS_LIMIT = 5

  decorates_assigned :category, :posts, :post

  def index
    @posts = Post.all_published.limit(POSTS_LIMIT)
  end

  def feed
    if params[:category]
      @category = Category.from_param(params[:category])
      @posts = @posts.by_category(@category)
    else
      @posts = Post.all_published
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
