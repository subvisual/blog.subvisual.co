GbBlog::Application.routes.draw do

  root to: "posts#index"

  resources :users, controller: :users, only: [:create]
  get 'category/:category', to: 'posts#index', as: :category
  resources :posts, only: [:show]

  get '/feed' => 'posts#feed'

  namespace :admin do
    get '/', to: 'admin#dashboard', as: :dashboard

    resources :posts, only: [:index, :show, :new, :create, :edit, :update] do
      patch :publish
      patch :unpublish
    end

    get 'me', to: 'users#show', as: :me
    patch 'me', to: 'users#update', as: :update_me
    resources :users, only: [:show, :update]
  end

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
end
