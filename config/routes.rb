Rails.application.routes.draw do
  devise_for :users
  get "/", to: "pages#home"
  get "/play", to: "pages#play"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
