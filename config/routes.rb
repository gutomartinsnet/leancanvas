Rails.application.routes.draw do
  resources :plans do
    member do
      post 'imgsave', to: 'plans#imgsave'
    end
  end


  # devise_for :users
  # devise_for :users, controllers: { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :users, controllers: {
    :omniauth_callbacks => "omniauth_callbacks",
    sessions:      'users/sessions'
  }

  get 'users/show'

  root to: 'users#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
