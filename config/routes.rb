GbBlog::Application.routes.draw do

  root to: "application#teste"

  resources :users, controller: :users, only: [:create]

  resources :posts, only: [:index, :show]
end
