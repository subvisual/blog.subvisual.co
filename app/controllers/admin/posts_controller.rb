  class Admin::PostsController < Admin::ApplicationController
    decorates_assigned :posts, :post
    after_action :invalidate_cache, only: %i(create update)

    def index
      @drafts = current_user.posts.unpublished
      @posts = Post.published.includes(:tags)
    end

    def new
      @post = Post.new author: current_user
      @post.build_hero unless @post.hero
    end

    def edit
      @post = Post.find params[:id]
      @post.build_hero unless @post.hero
    end

    def create
      @post = Post.new post_params
      @post.author = current_user

      if @post.save
        github_adapter.create_pr
        handle_save_redirect
      else
        render :new
      end
    end

    def update
      @post = Post.find params[:id]

      if @post.update(post_params)
        github_adapter.update_pr
        handle_save_redirect
      else
        render :edit
      end
    end

    def publish
      @post = Post.find params[:post_id]
      @post.update_attribute :published_at, Time.now
      github_adapter.close_pr
      redirect_to post_path(@post), alert: 'Post successfully published'
    end

    def unpublish
      @post = Post.find params[:post_id]
      @post.update_attribute :published_at, nil
      redirect_to admin_post_path(@post), alert: 'Post successfully unpublished'
    end

    private

    def github_adapter
      Github.adapter.new(@post)
    end

    def handle_save_redirect
      if params[:commit] == 'preview'
        redirect_to post_path(@post)
      else
        redirect_to edit_admin_post_path(@post), alert: 'Post successfully saved'
      end
    end

    def post_params
      params.require(:post).permit(:title, :body, :extra_tags, tag_list: [], hero_attributes: [:id, :image, :remove_image])
    end

    def invalidate_cache
      Rails.cache.delete('search_tags')
    end
  end
