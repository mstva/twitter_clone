Rails.application.routes.draw do

  root to: "twits#index"

  resources :twits
  resources :users, only: [:index]

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }, path_names: { sign_in: :login, sign_up: :register, sign_out: :logout}

  devise_scope :user do
    get '/users/logout' => 'users/sessions#destroy'
  end
end
