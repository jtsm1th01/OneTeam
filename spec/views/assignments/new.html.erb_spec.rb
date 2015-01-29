require 'rails_helper'

RSpec.describe "assignments/new", :type => :view do
  before(:each) do
    assign(:assignment, Assignment.new(
      :employee_id => 1,
      :project_request_id => 1
    ))
  end

  it "renders new assignment form" do
    render

    assert_select "form[action=?][method=?]", assignments_path, "post" do

      assert_select "input#assignment_employee_id[name=?]", "assignment[employee_id]"

      assert_select "input#assignment_project_request_id[name=?]", "assignment[project_request_id]"
    end
  end
end
