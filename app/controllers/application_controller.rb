class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :load_categories
  before_filter :load_saying

  helper_method :is_admin_controller?
  decorates_assigned :categories

  rescue_from
    CanCan::AccessDenied,
    ActionController::RoutingError,
    ActionController::UnknownController.
    ActionController::UnknownAction,
    ActiveRecord::RecordNotFound,
    with :render_404

  def is_admin_controller?
    false
  end

  private

  def load_categories
    @categories = Category.all
  end

  def load_saying
    @saying = Saying.current
  end

  def render_404(exception)
    logger.info exception.backtrace.join '\n'
    redirect_to root_url unless current_user
  end

end
