class TagController < ApplicationController
  decorates_assigned :posts
  def show
    @tag = params[:tag]
    @posts = Post.tagged_with(@tag)
  end
end
