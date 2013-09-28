class PostsController < ApplicationController

  def index
    @posts = Post.all_published
  end

  def show
    @post = Post.find(params[:id])
  end

  private
    def post_params
      params[:post]
    end
end
