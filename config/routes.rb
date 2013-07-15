GbBlog::Application.routes.draw do
  root to: "application#teste"

  resource :users, controller: :users, only: [:create]
end
