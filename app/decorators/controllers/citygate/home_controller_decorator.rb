Citygate::HomeController.class_eval do
  def index
    p "here"
    redirect_to boss.posts_path
  end
end
