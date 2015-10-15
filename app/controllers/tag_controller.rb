class TagController < ApplicationController
  def show
    @tag = params[:tag]
    @posts = Post.published.tagged_with(@tag).includes(:tags)

    redirect_to posts_path if @posts.none?
  end
end
