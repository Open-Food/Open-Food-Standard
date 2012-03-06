Api::Application.routes.draw do
  root :to => "home#index"
  resources :foods, :only => [:index, :create, :show, :new] do
    resources :properties, :only => [:create]
  end
end
