class PostsController < ApplicationController
  def index
    @posts = Post.recent.published.includes(:tags)
    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

  def search
    @query = search_params[:q] || ""
    @posts = begin
      PgSearch.multisearch(@query).limit(20).map(&:searchable)
    rescue StandardError
      Post.none
    end
  end

  def show
    @post = Post.find(params[:id])
    authorize! :read, @post
  end

  private

  def search_params
    params.require(:search).permit(:q)
  end
end
