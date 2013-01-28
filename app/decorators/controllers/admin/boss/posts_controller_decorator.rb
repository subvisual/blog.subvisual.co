Boss::Post::ApplicationController.class_eval do
  layout "admin"

  def index
    @posts = Boss::Post.all
  end

end
