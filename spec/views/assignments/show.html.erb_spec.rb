require 'rails_helper'

RSpec.describe "assignments/show", :type => :view do
  before(:each) do
    @assignment = assign(:assignment, Assignment.create!(
      :employee_id => 1,
      :project_request_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
