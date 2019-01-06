class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update]

  def index
    @persons = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    respond_to do |format|
      if @person.save
        format.html { redirect_to person_path(@person), notice: 'Persona agregada correctamente.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to person_path(@person), notice: 'Datos actualizados.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to editor_persons_url, notice: 'Persona eliminado.' }
      format.json { head :no_content }
    end
  end

  private
  def person_params
    params.require(:person)
      .permit(:first_name, :last_name, :cuit, :phone, :address)
  end

    def set_person
      @person = Person.find(params[:id])
    end
end