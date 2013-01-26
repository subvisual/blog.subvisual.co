Blog::Application.routes.draw do
  #mount Citygate::Engine => "/"
  mount Boss::Engine => "/"

  root to: "boss/posts#index"
end
