Api::Application.routes.draw do
  root :to => "home#index"
  match "/api_docs" => "home#api_docs", :as => "api_docs"

  resources :foods, :only => [:index, :create, :show, :new] do
    resources :properties, :only => [:create]
  end
end
