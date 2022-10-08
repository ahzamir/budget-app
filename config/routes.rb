Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/info'
  get 'welcome/start'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    authenticated :user do
      root 'categories#index', as: :authenticated_root
    end
    unauthenticated { root 'welcome#index', as: :unauthenticated_root }
  end
  devise_for :users
  resources :users do
    resources :categories do
      resources :expenses
    end
  end
  resources :welcome, only: %i[index info start]
end

