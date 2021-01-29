Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  root to: "posts#index"

  resources :posts, only: [:new, :show, :create, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: :show do
    resources :profiles, only: [:new, :create, :edit ,:update] 
  end 

  resources :posts, only: [:new, :show, :create, :edit, :update, :destroy] do
    post 'add' => 'goods#create'
    delete '/add' => 'goods#destroy'
  end

  resources :users, only: :show do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]

end
