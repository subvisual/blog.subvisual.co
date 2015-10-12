class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :rack_mini_profiler_for_admins
  before_action :load_tags

  decorates_assigned :categories

  def admin_controller?
    false
  end
  helper_method :admin_controller?

  def load_tags
    @all_tags ||= Rails.cache.fetch('search_tags') do
      Post.published_tags.sort_by { |tag| Post::PRIMARY_TAGS.include?(tag.name.to_sym) ? 0 : 1 }.first(10)
    end
  end

  def rack_mini_profiler_for_admins
    if current_user
      Rack::MiniProfiler.authorize_request
    end
  end
end
