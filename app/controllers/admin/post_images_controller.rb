class Admin::PostImagesController < Admin::ApplicationController
  authorize_resource
  def create
    post = PostImage.create image_params
    session[:url] = request.env['HTTP_ORIGIN'] + post.image.url

    redirect_to request.referer
  end

  private

  def image_params
    params.require(:post_image).permit(:image)
  end
end
