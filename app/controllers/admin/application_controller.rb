class Admin::ApplicationController < ::ApplicationController
  layout "admin"
  before_filter :verify_admin

  def dashboard
  end

  def admin_controller?
    true
  end

  private

  def verify_admin
    redirect_to root_url unless current_user
  end
end
