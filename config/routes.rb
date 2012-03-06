Api::Application.routes.draw do
  root :to => "home#index"
  resources :things, :only => [:index, :create, :show, :new], :path => "foods" do
    resources :properties, :only => [:create]
  end
end
