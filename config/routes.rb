SubvisualBlog::Application.routes.draw do
  get '/' => redirect('/blog')
  get '/blog/auth/:provider/callback', to: 'sessions#create'

  scope '/blog' do
    constraints format: :html do
      root to: "posts#index"

      resources :posts, only: %i(index show) do
        collection do
          resources :tag, only: [:show], param: :tag
          get :search
        end
      end

      resources :passwords, controller: 'clearance/passwords', only: [:create, :new]
      resource :session, controller: 'clearance/sessions', only: [:create]
      resources :users, controller: 'clearance/users', only: [] do
        resource :password, controller: 'clearance/passwords', only: %i(create edit update)
      end

      get '/sign_in' => 'clearance/sessions#new', as: 'sign_in'
      delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'
      get '/sign_up' => 'clearance/users#new', as: 'sign_up'

      namespace :admin do
        get '/', to: 'application#dashboard', as: :dashboard

        resources :posts, except: %i(destroy) do
          patch :publish
          patch :unpublish
        end

        resources :users, only: [:edit, :update]
      end
    end
s
    defaults format: :rss do
      get '/feed' => 'feed#index', as: :feed
    end

    namespace :admin do
      defaults format: :json do
        resources :post_images, only: [:create]
      end
    end
  end
end
