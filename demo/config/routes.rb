Rails.application.routes.draw do

 get  '/signup',  to: 'users#new'
 get '/participant', to: 'participants#new' ,as: 'participant'

  get '/help', to: 'static_pages#help'
  
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  post '/signup',  to: 'users#create' ,as: 'user_create'
  post '/participant',  to: 'participants#create' ,as: 'participant_create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  patch '/users/:user_id/polls/:id(.:format)', to:'polls#richi', as:'participant_update'
  get 'users/:user_id/index', to:'polls#index1', as:'poll_index1'
  
  #polling
  #get '/polls', to: 'polls#index', as: 'polls'
  
  
  resources :participants
  resources :users do 
    resources :polls
    
   end
  resources :votes, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
