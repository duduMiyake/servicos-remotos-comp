Rails.application.routes.draw do
  resources :usuarios do
    get ":nome", to: "usuarios#playlists_by_user", on: :collection
  end
  resources :musicas
  resources :playlists do
    post "musicas", to: "playlists#add_musicas", on: :member
  end
end
