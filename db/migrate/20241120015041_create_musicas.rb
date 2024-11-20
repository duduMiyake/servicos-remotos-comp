class CreateMusicas < ActiveRecord::Migration[8.0]
  def change
    create_table :musicas do |t|
      t.string :nome
      t.string :artista

      t.timestamps
    end
  end
end
