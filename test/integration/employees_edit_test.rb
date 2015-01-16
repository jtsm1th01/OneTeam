require 'test_helper'

class EmployeesEditTest < ActionDispatch::IntegrationTest

  def setup
    @employee = employees(:MyString)
  end
 
  test "successful edit with friendly forwarding" do
    get edit_employee_path(@employee)
    log_in_as(@employee)
    assert_redirected_to edit_employee_path(@employee)
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch employee_path(@employee), employee: { employee_name:  name,
                                    employee_email: email,
                                    password:              "foobar",
                                    password_confirmation: "foobar" }
    assert_not flash.empty?
    assert_redirected_to @employee
    @employee.reload
    assert_equal @employee.name,  name
    assert_equal @employee.email, email
  end
end