class API::PostsController < API::ApplicationController
  def create
    post = Post.new post_params

    if post.save
      render json: { id: post.id }, status: 200
    else
      render json: { errors: post.errors.full_messages }.to_json, status: 422
    end
  end

  def update
    post = Post.find(params[:id])

    if post.published?
      render json: 'Already published'.to_json, status: 422
    else
      update_post(post)
    end
  end

  private

  def update_post(post)
    if post.update(post_params)
      render json: { id: post.id }, status: 200
    else
      render json: { errors: post.errors.full_messages }.to_json, status: 422
    end
  end

  def post_params
    params.
      require(:post).
      permit(:title, :body).
      merge(category_id: category_id, author_id: author_id)
  end

  def category_id
    Category.find_by_name(params[:post].delete(:category)).try(:id)
  end

  def author_id
    User.find_by_email(params[:post].delete(:author)).try(:id)
  end
end
