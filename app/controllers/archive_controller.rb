class ArchiveController < ApplicationController
  decorates_assigned :posts

  def index
    @posts = Post.all_published
  end

  private

  def filter_by_category
    if params[:category]
      category = Category.from_param(params[:category])
      @posts = @posts.by_category(category)
    end
  end

  def filter_by_author
    if params[:author]
      author = User.where(first_name: params[:author]).first
      @posts = @posts.by_author(author)
    end
  end
end
