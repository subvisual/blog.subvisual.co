class API::PostsController < API::ApplicationController
  def create
    post = Post.new post_params

    if post.save
      render json: :nothing, status: 200
    else
      render json: { errors: post.errors.full_messages }.to_json, status: 422
    end
  end

  def post_params
    category_id = Category.find_by_name(params[:post].delete(:category)).try(:id)
    author_id = User.find_by_email(params[:post].delete(:author)).try(:id)
    params.
      require(:post).
      permit(:title, :body).
      merge(category_id: category_id, author_id: author_id)
  end
end
