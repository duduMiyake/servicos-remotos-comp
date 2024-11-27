Rails.application.routes.draw do
  resources :usuarios do
    resources :playlists, only: [ :index ]
  end
  resources :musicas do
    get "playlists", to: "musicas#playlists", on: :member
  end
  resources :playlists do
    post "musicas", to: "playlists#add_musicas", on: :member
    get "musicas", to: "playlists#musicas", on: :member
  end
end
