class Admin::PagesController < ApplicationController
  layout "admin"
  def index
    @posts = Boss::Post.limit(5)
  end
end
