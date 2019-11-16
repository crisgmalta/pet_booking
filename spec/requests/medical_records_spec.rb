require 'rails_helper'

RSpec.describe "MedicalRecords", type: :request do
  describe "GET /medical_records" do
    it "works! (now write some real specs)" do
      get medical_records_path
      expect(response).to have_http_status(200)
    end
  end
end
