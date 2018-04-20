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

  # get 'users/show'
  get '/users/:username',to: 'users#show', as: 'users_show'
  #get '/users/:id',to: 'users#show', as: 'users_show'
  
  authenticated :user do
    root to: 'users#show'
  end

  root to:  'plans#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
