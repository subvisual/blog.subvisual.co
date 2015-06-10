class Admin::ApplicationController < ::ApplicationController
  layout 'admin'
  before_filter :verify_admin

  decorates_assigned :posts, :drafts, :user

  def dashboard
    @drafts = current_user.posts.unpublished
    @posts = Post.published
  end

  def admin_controller?
    true
  end

  private

  def verify_admin
    redirect_to root_url unless current_user
  end
end
