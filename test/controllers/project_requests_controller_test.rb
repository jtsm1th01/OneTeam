require 'test_helper'

class ProjectRequestsControllerTest < ActionController::TestCase
  setup do
    @project_request = project_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_request" do
    assert_difference('ProjectRequest.count') do
      post :create, project_request: { contact_id: @project_request.contact_id, department_id: @project_request.department_id, location_id: @project_request.location_id, project_end: @project_request.project_end, project_id: @project_request.project_id, project_start: @project_request.project_start, skill_id: @project_request.skill_id }
    end

    assert_redirected_to project_request_path(assigns(:project_request))
  end

  test "should show project_request" do
    get :show, id: @project_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_request
    assert_response :success
  end

  test "should update project_request" do
    patch :update, id: @project_request, project_request: { contact_id: @project_request.contact_id, department_id: @project_request.department_id, location_id: @project_request.location_id, project_end: @project_request.project_end, project_id: @project_request.project_id, project_start: @project_request.project_start, skill_id: @project_request.skill_id }
    assert_redirected_to project_request_path(assigns(:project_request))
  end

  test "should destroy project_request" do
    assert_difference('ProjectRequest.count', -1) do
      delete :destroy, id: @project_request
    end

    assert_redirected_to project_requests_path
  end
end
