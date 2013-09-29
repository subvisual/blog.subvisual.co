GbBlog::Application.routes.draw do

  root to: "posts#index"

  resources :users, controller: :users, only: [:create]
  resources :posts, only: [:index, :show]

  namespace :admin do
    get '/', to: 'admin#dashboard', as: :dashboard

    resources :posts, only: [:index, :show, :new, :create, :edit, :update] do
      patch :publish
      patch :unpublish
    end

    resources :users, only: [:index, :update]
  end
end
