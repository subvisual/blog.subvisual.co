class PostsController < ApplicationController
  decorates_assigned :posts, :post

  def index
    @posts = Post.published.recent
  end

  def feed
    @posts = Post.published.recent

    respond_to do |format|
      format.rss { render layout: false }
    end
  end

  def show
    @post = Post.find(params[:id])
    authorize! :read, @post
  end
end
