Citygate::HomeController.class_eval do
  layout "admin"
  
  def index
    redirect_to boss.posts_path
  end
end
