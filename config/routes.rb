Cotripping::Application.routes.draw do
match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
match 'auth/failure', to: redirect('/'), via: [:get, :post]
match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]


root to: "users#show", as: :authenticated_root, via: :get

root to: 'static_pages#home'


# root :to => 'static_pages#home', :constraints => lambda{|req| !req.session[:user_id].blank?}
# root :to => 'users#show'

# get '/', :to => 'users#show', :constraints => lambda{|req| !req.session[:user_id].blank?}, as: nil
# get '/', :to => 'static_pages#home', as: nil


resources :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
resources :trips

end
