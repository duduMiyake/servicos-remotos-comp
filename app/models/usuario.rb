class Usuario < ApplicationRecord
  has_many :playlists, dependent: :destroy
end
