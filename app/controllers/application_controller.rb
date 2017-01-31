class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_raven_context

  before_action do
    Rack::MiniProfiler.authorize_request if current_user
  end

  decorates_assigned :categories

  def admin_controller?
    false
  end
  helper_method :admin_controller?

  def all_tags
    Rails.cache.fetch("search_tags") do
      Post.sorted_published_tags.first(10)
    end
  end
  helper_method :all_tags

  def set_raven_context
    Raven.user_context(id: current_user.try(:id))
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
