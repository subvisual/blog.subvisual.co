class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :load_categories
  before_filter :load_saying

  helper_method :admin_controller?
  decorates_assigned :categories

  def admin_controller?
    false
  end

  private

  def load_categories
    @categories = Category.all
  end

  def load_saying
    @saying = Saying.current
  end
end
