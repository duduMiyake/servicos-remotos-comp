class PlaylistMusica < ApplicationRecord
  belongs_to :playlist
  belongs_to :musica
end
