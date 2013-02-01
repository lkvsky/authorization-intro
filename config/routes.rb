Authentication::Application.routes.draw do
 resources :users
 resource :session

 root :to => "session#new"
end
