require 'rails_helper'

RSpec.describe "reviews/index", :type => :view do
  before(:each) do
    assign(:reviews, [
      Review.create!(
        :assignment_id => 1
      ),
      Review.create!(
        :assignment_id => 1
      )
    ])
  end

  it "renders a list of reviews" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
