GbBlog::Application.routes.draw do

  root to: "posts#index"

  resources :users, controller: :users, only: [:create]
  get 'category/:category', to: 'posts#index', as: :posts
  resources :posts, only: [:show]

  namespace :admin do
    get '/', to: 'admin#dashboard', as: :dashboard

    resources :posts, only: [:index, :show, :new, :create, :edit, :update] do
      patch :publish
      patch :unpublish
    end

    resources :users, only: [:index, :update]
  end

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
end
