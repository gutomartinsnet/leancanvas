Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { :omniauth_callbacks => "users/omniauth_callbacks" }

  get 'users/show'

  root to: 'users#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
