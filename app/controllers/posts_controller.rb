class PostsController < ApplicationController

  def index
    @posts = Post.published
  end

  def show
    @post = Post.find(params[:id])
  end

  private
    def post_params
      params[:post]
    end
end
