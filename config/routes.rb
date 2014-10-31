Rails.application.routes.draw do
 
  get 'login', :to => "access#index"

  root :to => "public#index"
  match ':controller(/:action(/:id))', :via => [:get, :post]
end
