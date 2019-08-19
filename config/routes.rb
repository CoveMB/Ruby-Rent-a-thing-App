Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # User routes
  get "user/:id", to: "users#show", as: "user"
  # get "user/:id/reservations", to: "user#reservation"

  # Item routes
  get "item/new", to: "items#new"
  post "item", to: "items#create"
  patch "item/:item_id", to: "items#update"
  delete "item/:item_id", to: "items#destroy"

  # Reservation routes
  post "item/:item_id/reservation", to: "reservations#create"
  patch "reservation/reservation_id", to: "reservations#update"
  get "reservation/reservation_id", to: "reservations#show"
  delete "reservation/reservation_id", to: "reservations#destroy"

end
