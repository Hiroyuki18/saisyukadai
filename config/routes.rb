Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  get 'users/show'
  root 'items#index'

  resources :items, only: [:index, :new, :create, :show] do
    resources :dealings, only: :new
  end

  resources :users, only: [:show, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
