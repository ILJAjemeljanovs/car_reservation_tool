require 'rails_helper'

RSpec.describe "cars/index", type: :view do
  before(:each) do
    assign(:cars, [
      Car.create!(
        :number => "MyText"
      ),
      Car.create!(
        :number => "MyText"
      )
    ])
  end

  it "renders a list of cars" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
