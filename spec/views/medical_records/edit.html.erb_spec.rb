require 'rails_helper'

RSpec.describe "medical_records/edit", type: :view do
  before(:each) do
    @medical_record = assign(:medical_record, MedicalRecord.create!(
      :pet => nil,
      :symptoms => "MyText",
      :treatment => "MyText"
    ))
  end

  it "renders the edit medical_record form" do
    render

    assert_select "form[action=?][method=?]", medical_record_path(@medical_record), "post" do

      assert_select "input[name=?]", "medical_record[pet_id]"

      assert_select "textarea[name=?]", "medical_record[symptoms]"

      assert_select "textarea[name=?]", "medical_record[treatment]"
    end
  end
end
