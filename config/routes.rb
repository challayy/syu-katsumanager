Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations', # 追加
    unlocks: 'users/unlocks' # 追加
  }

  devise_scope :user do
    authenticated :user do
      root 'companies#index', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :companies do
    resources :tweets, only: [:index, :create, :destroy]
    collection do
      get 'calendar'
    end
  end

  resources :tweets do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show]
end