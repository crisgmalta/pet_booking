require 'rails_helper'

RSpec.describe "medical_records/show", type: :view do
  before(:each) do
    @medical_record = assign(:medical_record, MedicalRecord.create!(
      :pet => nil,
      :symptoms => "MyText",
      :treatment => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
