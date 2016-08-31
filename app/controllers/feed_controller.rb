class FeedController < ApplicationController
  def index
    @posts = Post.published.recent

    render layout: false
  end
end
