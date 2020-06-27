Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :projects, only: %i[index] do
    resources :todos, only: %i[create update]
  end

  resources :todos, only: %i[create update]
end
