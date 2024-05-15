Rails.application.routes.draw do
  resources :recipes
  resources :users

  resources :ingredients do
    resources :questions, only: %i[new create]
  end

  resources :questions, only: [] do
    resource :answers, only: %i[new create]
  end

  post "/set_current_user", to: "application#set_current_user"
  root "recipes#index"
end
