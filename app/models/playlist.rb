class Playlist < ApplicationRecord
  belongs_to :usuario
  has_many :playlist_musicas
  has_many :musicas, through: :playlist_musicas
end
