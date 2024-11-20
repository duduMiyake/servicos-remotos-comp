class CreateJoinTableMusicasPlaylists < ActiveRecord::Migration[8.0]
  def change
    create_join_table :musicas, :playlists do |t|
      t.index :musica_id
      t.index :playlist_id
    end
  end
end
