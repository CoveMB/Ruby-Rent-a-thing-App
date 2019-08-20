Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # User routes
  get "user/:id", to: "users#show", as: "user"
  # get "user/:id/reservations", to: "user#reservation"

  # Item routes
  get "item/new", to: "items#new", as: "new_item"
  post "items", to: "items#create"
  patch "items/:item_id", to: "items#update"
  delete "items/:item_id", to: "items#destroy"

  # Reservation routes
  post "item/:item_id/reservation", to: "reservations#create"
  get "reservation/reservation_id", to: "reservations#show"
  delete "reservation/reservation_id", to: "reservations#destroy"

end
