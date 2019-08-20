Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # User routes
  get "user/:id", to: "users#show", as: "user"

  # Item routes
  get "item/new", to: "items#new", as: "new_item"
  post "item", to: "items#create"
  patch "items/:item_id", to: "items#update", as: :edit_item
  delete "items/:item_id", to: "items#destroy"

  # Reservation routes
  post "item/:item_id/reservation", to: "reservations#create"
  delete "reservation/reservation_id", to: "reservations#destroy"

end
