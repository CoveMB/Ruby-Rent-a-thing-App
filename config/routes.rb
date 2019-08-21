Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # User routes
  # get "users/:id", to: "users#show", as: "user"
  resources :users, only:[:show] do
    resources :chats, only:[:index, :create, :show]
  end

  # Item routes
  get "item/new", to: "items#new", as: "new_item"
  post "item", to: "items#create"
  patch "items/:item_id", to: "items#update", as: :edit_item
  delete "items/:item_id", to: "items#destroy"

  # Reservation routes
  post "item/:item_id/reservation", to: "reservations#create"
  delete "reservation/reservation_id", to: "reservations#destroy"
  
  # Messaging routes
  # get "/users/:id/chats", to: "chats#create"
  # get "/users/:id/chats/:chat_id", to: "chats#index", as: "user_chats"
  # post "/users/:id/chats/:chat_id", to: "chats#show", as: "user_chat"

  resources :messages, only:[:create]

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
