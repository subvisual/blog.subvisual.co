class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :load_categories

  helper_method :is_admin_controller?

  def is_admin_controller?
    false
  end

  private

  def load_categories
    @categories = Category.all
  end

end
