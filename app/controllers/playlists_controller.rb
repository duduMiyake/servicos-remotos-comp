class PlaylistsController < ApplicationController
  before_action :set_playlist, only: %i[show update destroy add_musicas]

  # GET /playlists
  def index
    @playlists = Playlist.all
    render json: @playlists
  end

  # GET /playlists/:id
  def show
    render json: @playlist.to_json(include: :musicas)
  end

  # POST /playlists
  def create
    usuario = Usuario.find_by(nome: params[:usuario_nome])

    unless usuario
      return render json: { error: "Usuário não encontrado" }, status: :unprocessable_entity
    end

    @playlist = Playlist.new(nome: params[:nome], usuario: usuario)

    if @playlist.save
      render json: @playlist, status: :created
    else
      render json: @playlist.errors, status: :unprocessable_entity
    end
  end

  # PUT /playlists/:id
  def update
    usuario = Usuario.find_by(nome: params[:playlist][:usuario_nome])
    unless usuario
      return render json: { error: "Usuário não encontrado" }, status: :unprocessable_entity
    end

    if @playlist.update(playlist_params.except(:usuario_nome).merge(usuario: usuario))
      render json: @playlist
    else
      render json: @playlist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /playlists/:id
  def destroy
    @playlist.destroy
  end

  # POST /playlists/:id/musicas
  def add_musicas
    musica = Musica.find(params[:musica_id])
    @playlist.musicas << musica
    render json: @playlist, status: :created
  end

  private

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  def playlist_params
    params.permit(:nome, :usuario_nome)
  end
end
