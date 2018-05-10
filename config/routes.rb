Rails.application.routes.draw do
  resources :quotes
  resources :queens do
    resources :quotes, only: [:index]
  end
  resources :episodes, only: [:index, :show]
  resources :seasons do
    resources :episodes, only: [:index]
  end
  post 'authenticate', to: 'authentication#authenticate'
end
