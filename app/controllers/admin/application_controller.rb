class Admin::ApplicationController < ::ApplicationController
  layout 'admin'
  before_filter :verify_admin

  decorates_assigned :posts, :user

  def dashboard
    @posts = Post.visible_by current_user
    @user  = current_user
  end

  private

  def verify_admin
    redirect_to root_url unless current_user
  end
end
