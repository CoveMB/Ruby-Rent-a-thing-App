Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # User and messaging routes
  resources :users, only:[:show] do
    resources :chats, only:[:index, :create, :show]
  end

  resources :messages, only:[:create]

  # Item routes
  get "item/new", to: "items#new", as: "new_item"
  post "items", to: "items#create"
  patch "items/:item_id", to: "items#update", as: :edit_item
  delete "items/:item_id", to: "items#destroy", as: :delete_item

  # Reservation routes

  post "item/:item_id/reservation", to: "reservations#create", as: "new_reservation"
  delete "reservation/:reservation_id", to: "reservations#destroy"
  patch "reservation/:reservation_id", to: "reservations#update", as: "update_reservation"



  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
