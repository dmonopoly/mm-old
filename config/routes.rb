Memorymap::Application.routes.draw do # first created => highest priority
  
  namespace :person do
    resources :memories
    resources :locations
    # resources :time_frames
  end
  
  root :to => 'person/memories#index'
end