class TurnsController < ApplicationController
  before_action :set_turn, only: [:show, :edit, :update]

  def index
    @turns = Turn.all
  end

  def new
    @turn = Turn.new
  end

  def create
    @turn = Turn.new(turn_params)
    respond_to do |format|
      if @turn.save
        format.html { redirect_to turn_path(@turn), notice: 'Turno asignado correctamente.' }
        format.json { render :show, status: :created, location: @turn }
      else
        format.html { render :new }
        format.json { render json: @turn.errors, status: :unprocessable_entity }
      end
    end
  end

    def update
    respond_to do |format|
      if @turn.update(turn_params)
        format.html { redirect_to turn_path(@turn), notice: 'Datos actualizados.' }
        format.json { render :show, status: :ok, location: @turn }
      else
        format.html { render :edit }
        format.json { render json: @turn.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @turn.destroy
    respond_to do |format|
      format.html { redirect_to editor_turns_url, notice: 'Turno eliminado.' }
      format.json { head :no_content }
    end
  end

  private
  def turn_params
    params.require(:turn)
      .permit(:number, :turn_date, :turn_time, :place, :person_id)
  end

    def set_turn
      @turn = Turn.find(params[:id])
    end
end