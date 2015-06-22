class TagController < ApplicationController
  decorates_assigned :posts
  def show
    @tag = params[:tag]
    @posts = Post.published.tagged_with(@tag)

    if @posts.none?
      redirect_to posts_path
    end
  end
end
