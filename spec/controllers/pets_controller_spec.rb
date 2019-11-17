require 'rails_helper'

RSpec.describe PetsController, type: :controller do

  let(:valid_attributes) do
    {
      name: "name",
      "birth_date(1i)"=>"2019",
      "birth_date(2i)"=>"11",
      "birth_date(3i)"=>"17",
      breed: "breed",
      pet_kind: "Cachorro"
    }
  end

  let(:invalid_attributes) do
    {
      name: "nome",
      "birth_date(1i)"=>"2019",
      "birth_date(2i)"=>"11",
      "birth_date(3i)"=>"17",
      breed: "raça",
      pet_kind: "Cachorro_invalid"
    }
  end

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Pet.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      pet = Pet.create! valid_attributes
      get :show, params: {id: pet.to_param}, session: valid_session
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
      pet = Pet.create! valid_attributes
      get :edit, params: {id: pet.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Pet" do
        expect {
          post :create, params: {pet: valid_attributes}, session: valid_session
        }.to change(Pet, :count).by(1)
      end

      it "redirects to the created pet" do
        post :create, params: {pet: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Pet.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {pet: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { valid_attributes.merge(name: "new name") }

      it "updates the requested pet" do
        pet = Pet.create! valid_attributes
        put :update, params: {id: pet.to_param, pet: new_attributes}, session: valid_session
        pet.reload
        expect(pet.name).to eq "new name"
      end

      it "redirects to the pet" do
        pet = Pet.create! valid_attributes
        put :update, params: {id: pet.to_param, pet: valid_attributes}, session: valid_session
        expect(response).to redirect_to(pet)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        pet = Pet.create! valid_attributes
        put :update, params: {id: pet.to_param, pet: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested pet" do
      pet = Pet.create! valid_attributes
      expect {
        delete :destroy, params: {id: pet.to_param}, session: valid_session
      }.to change(Pet, :count).by(-1)
    end

    it "redirects to the pets list" do
      pet = Pet.create! valid_attributes
      delete :destroy, params: {id: pet.to_param}, session: valid_session
      expect(response).to redirect_to(pets_url)
    end
  end

end
