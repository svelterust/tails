Rails.application.routes.draw do
  root "home#show", as: "home"

  get "/login" => "login#new"
  post "/login" => "login#create"
  delete "/login" => "login#destroy"

  get "/register" => "register#new"
  post "/register" => "register#create"

  get "/dashboard" => "dashboard#show"
end
