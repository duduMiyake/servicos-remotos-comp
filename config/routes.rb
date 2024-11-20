Rails.application.routes.draw do
  resources :usuarios
  resources :musicas
  resources :playlists do
    post "musicas", to: "playlists#add_musicas", on: :member
  end
end
