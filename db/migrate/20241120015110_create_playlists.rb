class CreatePlaylists < ActiveRecord::Migration[8.0]
  def change
    create_table :playlists do |t|
      t.string :nome
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
