GbBlog::Application.routes.draw do

  root to: "posts#index"

  resources :users, controller: :users, only: [:create]
  resources :posts, only: [:show]
  resource :archive, only: [:show]

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
