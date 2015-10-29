class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  decorates_assigned :categories

  def admin_controller?
    false
  end
  helper_method :admin_controller?

  def all_tags
    Rails.cache.fetch('search_tags') do
      Post.sorted_published_tags.first(10)
    end
  end
  helper_method :all_tags
end
