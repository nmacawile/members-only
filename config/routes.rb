Rails.application.routes.draw do
  
  root 'static_pages#home'
  get  '/about'   => 'static_pages#about'
  get  '/help'    => 'static_pages#help'
  get  '/contact' => 'static_pages#contact'
  get  '/signup'  => 'users#new'
  post '/signup'  => 'users#create'
  resources :users
  get  '/login'   => 'sessions#new'
  post '/login'   => 'sessions#create'
  delete '/logout'=> 'sessions#destroy'
  resources :posts, except: [:index, :show, :edit, :update, :new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
