class MunicipesController < ApplicationController
  before_action :set_municipe, only: %i[show edit update destroy]

  # GET /municipes or /municipes.json
  def index
    @municipes = Municipe.all

    if params[:municipe].present? && municipe_params[:busca].present?
      #@municipes = Municipe.filtrar(@municipes, municipe_params[:busca])
    end

  end

  # GET /municipes/1 or /municipes/1.json
  def show
  end

  # GET /municipes/new
  def new
    @municipe = Municipe.new
  end

  # GET /municipes/1/edit
  def edit
  end

  # POST /municipes or /municipes.json
  def create
    @municipe = Municipe.new(municipe_params)

    respond_to do |format|
      if @municipe.save

        # Criando fila para envio de emails
        UserMailerJob.perform_later(@municipe)

        format.html { redirect_to '/', notice: "Municipe foi criado com sucesso." }
        format.json { render :show, status: :created, location: @municipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @municipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /municipes/1 or /municipes/1.json
  def update
    respond_to do |format|
      if @municipe.update(municipe_params)
        format.html { redirect_to municipe_path, notice: "Municipe foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @municipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @municipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /municipes/1 or /municipes/1.json
  def destroy
  #   @municipe.destroy!

  #   respond_to do |format|
  #     format.html { redirect_to municipes_url, notice: "Municipe foi destruido com sucesso." }
  #     format.json { head :no_content }
  #   end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_municipe
      @municipe = Municipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def municipe_params
      params.require(:municipe).permit(:imagem, :nome_completo, :cpf, :cns, :email, 
        :data_nascimento, :telefone, :status, :busca)
    end
end
