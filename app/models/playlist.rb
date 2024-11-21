class Playlist < ApplicationRecord
  belongs_to :usuario
  has_and_belongs_to_many :musicas

  validates :nome, presence: true
  validates :usuario, presence: true
end
