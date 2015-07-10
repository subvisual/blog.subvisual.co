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
    @all_tags ||= Post.all_tags
      .select  { |tag| Post.published.tagged_with(tag).any? }
      .sort_by { |tag| Post::PRIMARY_TAGS.include?(tag.name.to_sym) ? 0 : 1 }.first(10)
  end
end
