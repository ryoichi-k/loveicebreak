Rails.application.routes.draw do
  devise_for :users
  root 'home#top'

  post "users/create" => "users#create"
  get    'signup' => 'users#new'
  get "login" => "users#login_form"
  post "login" => "users#login"
  get    'users'=>'users#index'
  get    'users/:id' => 'users#show'
  get "users/:id/edit"=>"users#edit"
  post"users/:id/update"=>"users#update"
  post "logout"=>"users#logout"

  get"icebreaks/new"=>"icebreaks#new"
  get "icebreaks"=> "icebreaks#index"
  get "icebreaks/:id"=> "icebreaks#show"
  post "icebreaks/create"=>"icebreaks#create"
  get "icebreaks/:id/edit"=>"icebreaks#edit"
  post "icebreaks/:id/update"=>"icebreaks#update"
  post "icebreaks/:id/destroy"=>"icebreaks#destroy"

  get "comments/:id"=> "comments#show"
  post "comments/create"=>"comments#create"
  get "comments/:id/edit"=>"comments#edit"
  post "comments/:id/update"=>"comments#update"
  post "comments/:id/destroy"=>"comments#destroy"
  
end
