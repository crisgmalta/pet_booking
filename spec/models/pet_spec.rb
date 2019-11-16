require 'rails_helper'

RSpec.describe Pet, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:birth_date) }
    it { should validate_presence_of(:breed) }
    it { should validate_presence_of(:pet_kind) }
  end
end
