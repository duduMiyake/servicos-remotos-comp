class CreatePlaylistMusicas < ActiveRecord::Migration[8.0]
  def change
    create_table :playlist_musicas do |t|
      t.references :playlist, null: false, foreign_key: true
      t.references :musica, null: false, foreign_key: true

      t.timestamps
    end
  end
end
