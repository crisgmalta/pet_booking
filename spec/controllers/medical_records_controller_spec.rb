require 'rails_helper'

RSpec.describe MedicalRecordsController, type: :controller do
  let(:pet) { Pet.create!(name: "Name", birth_date: DateTime.now, breed: "breed", pet_kind: "Cachorro") }

  let(:valid_attributes) do
    {
      pet_id: pet.id,
      symptoms: "symptoms test",
      treatment: "treatment test"
    }
  end

  let(:invalid_attributes) do
    {
      symptoms: "symptoms test",
      treatment: nil
    }
  end

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      MedicalRecord.create! valid_attributes
      get :index, params: { pet_id: pet.id }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      medical_record = MedicalRecord.create! valid_attributes
      get :show, params: { pet_id: pet.id, id: medical_record.to_param}, session: valid_session
      expect(response).to redirect_to root_path
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: valid_attributes, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      medical_record = MedicalRecord.create! valid_attributes
      get :edit, params: {pet_id: pet.id, id: medical_record.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new MedicalRecord" do
        expect {
          post :create, params: {pet_id: pet.id, medical_record: valid_attributes}, session: valid_session
        }.to change(MedicalRecord, :count).by(1)
      end

      it "redirects to the created medical_record" do
        post :create, params: {pet_id: pet.id, medical_record: valid_attributes}, session: valid_session
        expect(response).to redirect_to(pet_medical_records_path(pet))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {pet_id: pet.id, medical_record: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { valid_attributes.merge(symptoms: "new symptoms tests") }

      it "updates the requested medical_record" do
        medical_record = MedicalRecord.create! valid_attributes
        put :update, params: {pet_id: pet.id, id: medical_record.to_param, medical_record: new_attributes}, session: valid_session
        medical_record.reload
        expect(medical_record.symptoms.to_s).to match(/new symptoms tests/)
      end

      it "redirects to the medical_record" do
        medical_record = MedicalRecord.create! valid_attributes
        put :update, params: {pet_id: pet.id, id: medical_record.to_param, medical_record: valid_attributes}, session: valid_session
        expect(response).to redirect_to(pet_medical_records_path(pet))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        medical_record = MedicalRecord.create! valid_attributes
        put :update, params: {pet_id: pet.id, id: medical_record.to_param, medical_record: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested medical_record" do
      medical_record = MedicalRecord.create! valid_attributes
      expect {
        delete :destroy, params: {pet_id: pet.id, id: medical_record.to_param}, session: valid_session
      }.to change(MedicalRecord, :count).by(-1)
    end

    it "redirects to the medical_records list" do
      medical_record = MedicalRecord.create! valid_attributes
      delete :destroy, params: {pet_id: pet.id, id: medical_record.to_param}, session: valid_session
      expect(response).to redirect_to(pet_medical_records_path(pet))
    end
  end

end
