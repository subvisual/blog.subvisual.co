class PostsController < ApplicationController

  def index
    @posts = Post.all_published
    if params[:category]
      @category = Category.from_param(params[:category])
      @posts = @posts.by_category(@category)
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
