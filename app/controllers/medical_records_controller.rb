class MedicalRecordsController < ApplicationController
  before_action :find_pet
  before_action :set_medical_record, only: [:show, :edit, :update, :destroy]

  # GET /medical_records
  # GET /medical_records.json
  def index
    @medical_records = @pet.medical_records.all
  end

  # GET /medical_records/1
  # GET /medical_records/1.json
  def show
    redirect_to root_path
  end

  # GET /medical_records/new
  def new
    @medical_record = @pet.medical_records.new
  end

  # GET /medical_records/1/edit
  def edit
  end

  # POST /medical_records
  # POST /medical_records.json
  def create
    @medical_record = @pet.medical_records.new(medical_record_params)

    respond_to do |format|
      if @medical_record.save
        format.html { redirect_to pet_medical_records_path(@pet), notice: 'Medical record was successfully created.' }
        format.json { render :show, status: :created, location: pet_medical_record_path(@pet, @medical_record) }
      else
        format.html { render :new }
        format.json { render json: @medical_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medical_records/1
  # PATCH/PUT /medical_records/1.json
  def update
    respond_to do |format|
      if @medical_record.update(medical_record_params)
        format.html { redirect_to pet_medical_records_path(@pet), notice: 'Medical record was successfully updated.' }
        format.json { render :show, status: :ok, location: pet_medical_record_path(@pet, @medical_record) }
      else
        format.html { render :edit }
        format.json { render json: @medical_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_records/1
  # DELETE /medical_records/1.json
  def destroy
    @medical_record.destroy
    respond_to do |format|
      format.html { redirect_to pet_medical_records_path(@pet), notice: 'Medical record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  def find_pet
    @pet = Pet.find(params[:pet_id])
  end

  def set_medical_record
    @medical_record = @pet.medical_records.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def medical_record_params
    params.require(:medical_record).permit(:pet_id, :symptoms, :treatment)
  end
end
