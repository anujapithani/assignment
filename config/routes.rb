Rails.application.routes.draw do
  resources :forecasts
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'admin/create'
  get 'admin/new'
  get 'admin/index'
  get '/signup' => 'admins#new'

  post '/admin' => 'admins#create'

 

  get '/' => 'admins#index'

  get '/login' => 'sessions#new'

post '/login' => 'sessions#create'

get '/logout' => 'sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "mains#index"
  get "/feedbackform", to: "feedbackforms#index"
  get "/employee", to: "employees#index" 
  get "/student", to: "students#index"
  get "/emp", to: "employees#edit"
  get "/inc", to: "incomes#index"
  resources :incomes
  resources :mains
  resources  :employees 
  resources :students
  resources :feedbackforms
end
