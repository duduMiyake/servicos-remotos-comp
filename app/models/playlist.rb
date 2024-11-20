class Playlist < ApplicationRecord
  belongs_to :usuario
  has_and_belongs_to_many :musicas
end
