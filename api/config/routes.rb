Api::Application.routes.draw do
  root :to => "home#index"
  resources :things, :only => [:index]
end
