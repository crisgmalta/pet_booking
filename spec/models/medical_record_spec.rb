require 'rails_helper'

RSpec.describe MedicalRecord, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:symptoms) }
    it { should validate_presence_of(:treatment) }
  end
end
