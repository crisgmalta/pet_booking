require 'rails_helper'

RSpec.describe "medical_records/index", type: :view do
  before(:each) do
    assign(:medical_records, [
      MedicalRecord.create!(
        :pet => nil,
        :symptoms => "MyText",
        :treatment => "MyText"
      ),
      MedicalRecord.create!(
        :pet => nil,
        :symptoms => "MyText",
        :treatment => "MyText"
      )
    ])
  end

  it "renders a list of medical_records" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
