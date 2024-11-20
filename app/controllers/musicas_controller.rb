class MusicasController < ApplicationController
  before_action :set_musica, only: %i[show update destroy]

  # GET /musicas
  def index
    @musicas = Musica.all
    render json: @musicas
  end

  # GET /musicas/:id
  def show
    render json: @musica
  end

  # POST /musicas
  def create
    @musica = Musica.new(musica_params)

    if @musica.save
      render json: @musica, status: :created
    else
      render json: @musica.errors, status: :unprocessable_entity
    end
  end

  # PUT /musicas/:id
  def update
    if @musica.update(musica_params)
      render json: @musica
    else
      render json: @musica.errors, status: :unprocessable_entity
    end
  end

  # DELETE /musicas/:id
  def destroy
    @musica.destroy
  end

  private

  def set_musica
    @musica = Musica.find(params[:id])
  end

  def musica_params
    params.require(:musica).permit(:nome, :artista)
  end
end
