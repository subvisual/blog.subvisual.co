module Admin
  class PostsController < Admin::ApplicationController

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

    private

    def post_params
      params.require(:post).permit(:category, :title, :body)
    end

  end
end
