Api::Application.routes.draw do
  root :to => "home#index"
  resources :things, :only => [:index, :create, :show] do
    resources :properties, :only => [:create]
  end
end
