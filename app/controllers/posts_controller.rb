class PostsController < ApplicationController
  decorates_assigned :category, :posts, :post

  def index
    if params[:category]
      @category = Category.from_param(params[:category])
      @posts = Post.by_category(@category)
    else
      @posts = Post.all_published
    end
  end

  def archive
    @posts = Post.all_published
    filter_by_category
    filter_by_author
  end

  def author_index
    author = User.where(first_name: params[:author]).first
    @posts = Post.all_published.by_author(author)

    render :index
  end

  def feed
    if params[:category]
      @category = Category.from_param(params[:category])
      @posts = @posts.by_category(@category)
    else
      @posts = Post.all_published
    end

    respond_to do |format|
      format.rss { render layout: false }
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
