module Admin
  class PostsController < Admin::AdminController

    def index
      @posts = Post.all
    end

    def new
      @post = Post.new
    end

    def edit
      @post = Post.find params[:id]
    end

    def create
      @post = Post.new post_params
      @post.author = current_user

      if @post.save
        redirect_to admin_posts_path, alert: 'Post successfully saved'
      else
        render :new
      end
    end

    def update
      @post = Post.find params[:id]

      if @post.update(post_params)
        redirect_to admin_posts_path, alert: 'Post successfully saved'
      else
        render :edit
      end
    end

    def publish
      @post = Post.find params[:post_id]
      @post.update_attribute :published_at, Time.now
      redirect_to admin_posts_path, alert: 'Post successfully published'
    end

    def unpublish
      @post = Post.find params[:post_id]
      @post.update_attribute :published_at, nil
      redirect_to admin_posts_path, alert: 'Post successfully unpublished'
    end

    private

    def post_params
      params.require(:post).permit(:category_id, :title, :body)
    end

  end
end
