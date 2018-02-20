Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount ActionCable.server => '/cable'

devise_for :users, controllers: { registrations: 'registrations' , omniauth_callbacks: 'users/omniauth_callbacks' }

root to: "home#index"

get'/' => "home#index"

post 'post/create' =>"post#create"

post 'post/delete' => "post#delete"

get  '/users' => "home#users"

get 'user/location' => "home#location"

post '/location/create' => "home#create_location"

# get '/users/password/edit' => "devise/passwords#edit"

post 'comment/create' => "post#create_comment"

get '/user/settings' => "home#settings"

post '/user/destroy' => "home#destroy"

get '/chat' => "messages#show_chat"




# get ' /user/sign_in' => "home#index"

# get '/' => "home#index"

# get '/users' => "home#users"

end

