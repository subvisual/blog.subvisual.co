class Admin::PostImagesController < Admin::ApplicationController
  authorize_resource

  def create
    post = PostImage.create image_params
    render json: { filename: post.image }
  end

  private

  def image_params
    params.require(:post_image).permit(:image)
  end
end
