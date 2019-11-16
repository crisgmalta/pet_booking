require 'rails_helper'

RSpec.describe "medical_records/new", type: :view do
  before(:each) do
    assign(:medical_record, MedicalRecord.new(
      :pet => nil,
      :symptoms => "MyText",
      :treatment => "MyText"
    ))
  end

  it "renders new medical_record form" do
    render

    assert_select "form[action=?][method=?]", medical_records_path, "post" do

      assert_select "input[name=?]", "medical_record[pet_id]"

      assert_select "textarea[name=?]", "medical_record[symptoms]"

      assert_select "textarea[name=?]", "medical_record[treatment]"
    end
  end
end
