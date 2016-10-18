Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  get '/about' => 'home#about', as: :about

  resources :users, only: [:new, :create, :show]
  namespace :users, path: 'user' do
    resources :speakers, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :sessions, only: [:new, :create, :destroy]

  resources :speakers, only: [:show, :index]

end
