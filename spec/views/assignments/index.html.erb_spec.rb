require 'rails_helper'

RSpec.describe "assignments/index", :type => :view do
  before(:each) do
    assign(:assignments, [
      Assignment.create!(
        :employee_id => 1,
        :project_request_id => 2
      ),
      Assignment.create!(
        :employee_id => 1,
        :project_request_id => 2
      )
    ])
  end

  it "renders a list of assignments" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
