Memorymap::Application.routes.draw do # first created => highest priority
  
  resources :memories
  
  root :to => 'memories#index'
end