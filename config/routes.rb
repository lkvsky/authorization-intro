Authentication::Application.routes.draw do
 resources :users
 resource :session
 resources :posts

 root :to => "session#new"
end
