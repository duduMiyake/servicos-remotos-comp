class Musica < ApplicationRecord
  has_many :playlist_musicas
  has_many :playlists, through: :playlist_musicas
end
