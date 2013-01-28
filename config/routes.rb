Blog::Application.routes.draw do
  #mount Citygate::Engine => "/"
  mount Boss::Engine => "/"
  match "/admin" => "admin/pages#index", as: "admin_root"
  root to: "boss/posts#index"
end
