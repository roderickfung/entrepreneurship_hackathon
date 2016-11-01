Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  get '/about' => 'home#about', as: :about
  get '/contact' => 'home#contact', as: :contact
  get '/resources' => 'home#resources', as: :resources

  resources :users
  namespace :users, path: 'user' do
    resources :speakers, only: [:new, :create, :edit, :update, :destroy]
    resources :events, except: [:index, :show]
    resources :sponsors, except: [:index, :show]
  end

  resources :sessions, only: [:new, :create, :destroy]

  resources :speakers, only: [:show, :index]
  resources :sponsors, only: [:show, :index]
  resources :events, only: [:show, :index]
  resources :participants, only: [:new, :create]

end
