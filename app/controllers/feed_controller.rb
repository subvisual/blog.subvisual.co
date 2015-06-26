class FeedController < ApplicationController
  decorates_assigned :posts

  def index
    @posts = Post.published.recent

    render layout: false
  end
end
