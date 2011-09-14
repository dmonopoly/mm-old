Memorymap::Application.routes.draw do # first created => highest priority
  
  namespace :person do
    resources :memories
  end
  
  root :to => 'person/memories#index'
end