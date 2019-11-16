require 'rails_helper'

RSpec.describe "pets/index", type: :view do
  before(:each) do
    assign(:pets, [
      Pet.create!(
        :name => "Name",
        :breed => "Breed",
        :pet_kind => "Pet Kind"
      ),
      Pet.create!(
        :name => "Name",
        :breed => "Breed",
        :pet_kind => "Pet Kind"
      )
    ])
  end

  it "renders a list of pets" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Breed".to_s, :count => 2
    assert_select "tr>td", :text => "Pet Kind".to_s, :count => 2
  end
end
