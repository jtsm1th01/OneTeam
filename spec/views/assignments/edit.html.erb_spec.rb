require 'rails_helper'

RSpec.describe "assignments/edit", :type => :view do
  before(:each) do
    @assignment = assign(:assignment, Assignment.create!(
      :employee_id => 1,
      :project_request_id => 1
    ))
  end

  it "renders the edit assignment form" do
    render

    assert_select "form[action=?][method=?]", assignment_path(@assignment), "post" do

      assert_select "input#assignment_employee_id[name=?]", "assignment[employee_id]"

      assert_select "input#assignment_project_request_id[name=?]", "assignment[project_request_id]"
    end
  end
end
