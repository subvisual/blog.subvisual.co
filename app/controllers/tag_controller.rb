class TagController < ApplicationController
  decorates_assigned :posts
  def show
    @tag = params[:tag]
    @posts = Post.published.tagged_with(@tag)
  end
end
