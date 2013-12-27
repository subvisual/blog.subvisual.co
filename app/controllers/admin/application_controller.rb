class Admin::ApplicationController < ::ApplicationController
  layout 'application'

  decorates_assigned :posts, :user

  def is_admin_controller?
    true
  end

  authorize_resource

  def dashboard
    @posts = Post.visible_by current_user
    @user  = current_user
  end

  def create_saying
    saying_params = params.require(:saying).permit(:saying)
    Saying.create!(saying_params)
    redirect_to admin_dashboard_path
  end
end
