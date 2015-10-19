class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :load_tags

  decorates_assigned :categories

  def admin_controller?
    false
  end
  helper_method :admin_controller?

  def load_tags
    @all_tags ||= Rails.cache.fetch('search_tags') do
      Post.sorted_published_tags.first(10)
    end
  end
end
