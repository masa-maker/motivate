Rails.application.routes.draw do
  root to: 'homes#index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }


  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: :show do
    resources :profiles, only: [:new, :create, :edit ,:update] 
  end 

  resources :posts do
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
