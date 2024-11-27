# Populando Usuários com verificação para duplicados
usuarios = [
  { nome: "João", idade: 30 },
  { nome: "Maria", idade: 25 },
  { nome: "José", idade: 35 },
  { nome: "Ana", idade: 28 },
  { nome: "Carlos", idade: 40 },
  { nome: "Fernanda", idade: 32 }
]

usuarios.each do |usuario_data|
  Usuario.find_or_create_by(nome: usuario_data[:nome]) do |usuario|
    usuario.idade = usuario_data[:idade]
  end
end

# Populando Músicas com verificação para duplicados
musicas = [
  { nome: "Música A", artista: "Artista X" },
  { nome: "Música B", artista: "Artista Y" },
  { nome: "Música C", artista: "Artista Z" },
  { nome: "Música D", artista: "Artista W" },
  { nome: "Música E", artista: "Artista V" },
  { nome: "Música F", artista: "Artista U" }
]

musicas.each do |musica_data|
  Musica.find_or_create_by(nome: musica_data[:nome]) do |musica|
    musica.artista = musica_data[:artista]
  end
end

# Populando Playlists com verificação para duplicados
playlists = [
  { nome: "Playlist 1", usuario_id: Usuario.find_by(nome: "João").id },
  { nome: "Playlist 2", usuario_id: Usuario.find_by(nome: "João").id },
  { nome: "Playlist 3", usuario_id: Usuario.find_by(nome: "Maria").id },
  { nome: "Playlist 4", usuario_id: Usuario.find_by(nome: "José").id },
  { nome: "Playlist 5", usuario_id: Usuario.find_by(nome: "Ana").id },
  { nome: "Playlist 6", usuario_id: Usuario.find_by(nome: "Carlos").id },
  { nome: "Playlist 7", usuario_id: Usuario.find_by(nome: "Fernanda").id }
]

playlists.each do |playlist_data|
  Playlist.find_or_create_by(nome: playlist_data[:nome], usuario_id: playlist_data[:usuario_id])
end

# Relacionando músicas com playlists (com variações)
playlist_musicas = [
  { playlist_id: Playlist.find_or_create_by(nome: "Playlist 1", usuario_id: Usuario.find_by(nome: "João").id).id, musica_id: Musica.find_or_create_by(nome: "Música A", artista: "Artista X").id },
  { playlist_id: Playlist.find_or_create_by(nome: "Playlist 1", usuario_id: Usuario.find_by(nome: "João").id).id, musica_id: Musica.find_or_create_by(nome: "Música B", artista: "Artista Y").id },
  { playlist_id: Playlist.find_or_create_by(nome: "Playlist 2", usuario_id: Usuario.find_by(nome: "João").id).id, musica_id: Musica.find_or_create_by(nome: "Música C", artista: "Artista Z").id },
  { playlist_id: Playlist.find_or_create_by(nome: "Playlist 2", usuario_id: Usuario.find_by(nome: "João").id).id, musica_id: Musica.find_or_create_by(nome: "Música D", artista: "Artista W").id },
  { playlist_id: Playlist.find_or_create_by(nome: "Playlist 3", usuario_id: Usuario.find_by(nome: "Maria").id).id, musica_id: Musica.find_or_create_by(nome: "Música E", artista: "Artista V").id },
  { playlist_id: Playlist.find_or_create_by(nome: "Playlist 3", usuario_id: Usuario.find_by(nome: "Maria").id).id, musica_id: Musica.find_or_create_by(nome: "Música A", artista: "Artista X").id },
  { playlist_id: Playlist.find_or_create_by(nome: "Playlist 4", usuario_id: Usuario.find_by(nome: "José").id).id, musica_id: Musica.find_or_create_by(nome: "Música F", artista: "Artista U").id },
  { playlist_id: Playlist.find_or_create_by(nome: "Playlist 5", usuario_id: Usuario.find_by(nome: "Ana").id).id, musica_id: Musica.find_or_create_by(nome: "Música B", artista: "Artista Y").id },
  { playlist_id: Playlist.find_or_create_by(nome: "Playlist 5", usuario_id: Usuario.find_by(nome: "Ana").id).id, musica_id: Musica.find_or_create_by(nome: "Música C", artista: "Artista Z").id },
  { playlist_id: Playlist.find_or_create_by(nome: "Playlist 6", usuario_id: Usuario.find_by(nome: "Carlos").id).id, musica_id: Musica.find_or_create_by(nome: "Música D", artista: "Artista W").id },
  { playlist_id: Playlist.find_or_create_by(nome: "Playlist 6", usuario_id: Usuario.find_by(nome: "Carlos").id).id, musica_id: Musica.find_or_create_by(nome: "Música E", artista: "Artista V").id }
]

playlist_musicas.each do |pm_data|
  PlaylistMusica.find_or_create_by(playlist_id: pm_data[:playlist_id], musica_id: pm_data[:musica_id])
end


playlist_musicas.each do |pm_data|
  PlaylistMusica.find_or_create_by(playlist_id: pm_data[:playlist_id], musica_id: pm_data[:musica_id])
end

puts "Usuários, músicas e playlists populados com sucesso!"
