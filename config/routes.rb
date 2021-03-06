Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create, :show, :destroy]
  resources :pitches, only: [:index, :new, :create, :show]
  resources :teams, only: [:show, :index, :new, :create]
  resources :sessions, only: [:new, :create]
  resources :rounds, only: [:index, :show] do
    resources :votes, only: [:new, :create]
  end

  get '/login' => 'sessions#login'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#logout'

  post '/open_round_1' => 'pitches#open_round_1'
  post '/open_round_2' => 'pitches#open_round_2'
  post '/close_round' => 'pitches#close_round'

  post '/move_to_round_2' => 'pitch_rounds#move_to_round_2'
  
  root to: 'sessions#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
