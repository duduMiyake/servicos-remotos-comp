class PlaylistsController < ApplicationController
  before_action :set_playlist, only: %i[show musicas]

  # GET /playlists
  def index
    if params[:usuario_id]
      # Filtra as playlists de um usuário específico
      @usuario = Usuario.find(params[:usuario_id])
      @playlists = @usuario.playlists
    else
      # Caso não tenha o usuario_id, retorna todas as playlists
      @playlists = Playlist.all
    end
    render json: @playlists
  end

  # GET /playlists/:id
  def show
    @playlist = Playlist.find(params[:id])
    render json: @playlist, include: :musicas
  end

  def musicas
    @musica_playlist = @playlist.musicas
    render json: @musica_playlist
  end

  # POST /playlists
  def create
    usuario = Usuario.find_by(nome: params[:usuario_nome])

    # Retorna erro se o usuário não for encontrado
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
