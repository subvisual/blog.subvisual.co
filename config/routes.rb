GbBlog::Application.routes.draw do

  root to: "posts#index"

  resources :users, controller: :users, only: [:create]
  get 'category/:category', to: 'posts#index', as: :category
  get 'author/:author', to: 'posts#author_index', as: :author
  resources :posts, only: [:show]

  get '/archive', to: 'archive#index', as: :archive

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

    post 'saying', to: 'admin#create_saying', as: :create_saying
  end

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
end
