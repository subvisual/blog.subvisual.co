class Admin::ApplicationController < ::ApplicationController
  layout 'admin'

  decorates_assigned :posts, :user

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
