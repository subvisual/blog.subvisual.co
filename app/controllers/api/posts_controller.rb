class API::PostsController < API::ApplicationController
  def create
    post = Post.new post_params

    if post.save
      render json: :nothing, status: 200
    else
      render json: { errors: post.errors.full_messages.to_json }, status: 422
    end
  end

  def post_params
    params.require(:post).permit(:category_id, :title, :body, :author_id)
  end
end
