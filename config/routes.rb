GbBlog::Application.routes.draw do

  root to: "posts#index"

  resources :users, controller: :users, only: [:create]
  resources :posts, only: [:index, :show]

  namespace :admin do
    resources :posts, only: [:index, :show, :new, :create, :edit, :update]
  end
end
