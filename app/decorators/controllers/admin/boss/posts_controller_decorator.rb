Boss::Post::ApplicationController.class_eval do

  def index
    @posts = Boss::Post.all
  end

end
