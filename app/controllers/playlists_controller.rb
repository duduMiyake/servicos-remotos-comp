class PlaylistsController < ApplicationController
  before_action :set_playlist, only: %i[show update destroy]

  # GET /playlists
  def index
    @playlists = Playlist.all
    render json: @playlists
  end

  # GET /playlists/:id
  def show
    render json: @playlist
  end

  # POST /playlists
  def create
    @playlist = Playlist.new(playlist_params)

    if @playlist.save
      render json: @playlist, status: :created
    else
      render json: @playlist.errors, status: :unprocessable_entity
    end
  end

  # PUT /playlists/:id
  def update
    if @playlist.update(playlist_params)
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
    @playlist = Playlist.find(params[:id])
    musica = Musica.find(params[:musica_id])

    @playlist.musicas << musica
    render json: @playlist
  end

  private

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  def playlist_params
    params.require(:playlist).permit(:nome, :usuario_id)
  end
end
