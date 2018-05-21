Rails.application.routes.draw do
  # root 'welcome#index'

  resources :quotes
  resources :queens do
    resources :quotes, only: [:index]
  end
  resources :episodes, only: [:index, :show]
  resources :seasons do
    resources :episodes, only: [:index]
  end

  resources :seasons, only: [:index, :show]

end
