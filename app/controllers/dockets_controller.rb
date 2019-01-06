class DocketsController < ApplicationController
  before_action :set_docket, only: [:show, :edit, :update]

  def index
    @dockets = Docket.all
  end

  def new
    @docket = Docket.new
  end

  def create
    @docket = Docket.new(docket_params)
    respond_to do |format|
      if @docket.save
        format.html { redirect_to docket_path(@docket), notice: 'Expediente creado correctamente.' }
        format.json { render :show, status: :created, location: @docket }
      else
        format.html { render :new }
        format.json { render json: @docket.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @docket.update(docket_params)
        format.html { redirect_to docket_path(@docket), notice: 'Datos actualizados.' }
        format.json { render :show, status: :ok, location: @docket }
      else
        format.html { render :edit }
        format.json { render json: @docket.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @docket.destroy
    respond_to do |format|
      format.html { redirect_to editor_dockets_url, notice: 'Expediente eliminado.' }
      format.json { head :no_content }
    end
  end

  private
  def docket_params
    params.require(:docket)
      .permit(:number, :description, :states, :person_id)
  end

    def set_docket
      @docket = Docket.find(params[:id])
    end
end