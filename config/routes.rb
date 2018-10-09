Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  resources :posts do
    resources :comments
  end

  get '/' => "home#index"
  get '/signin' => "sessions#new", as: :new_session
  post '/create-session' => "sessions#create", as: :create_session
  post '/logout' => "sessions#destroy"
  get '/profile' => "users#profile"
  post '/create-post' => "posts#create"
  get '/edit-profile' => "users#edit"
end
