require 'test_helper'

class ProjectCriteriaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_criterium = project_criteria(:one)
  end

  test "should get index" do
    get project_criteria_url
    assert_response :success
  end

  test "should get new" do
    get new_project_criterium_url
    assert_response :success
  end

  test "should create project_criterium" do
    assert_difference('ProjectCriterium.count') do
      post project_criteria_url, params: { project_criterium: { name: @project_criterium.name, value: @project_criterium.value } }
    end

    assert_redirected_to project_criterium_url(ProjectCriterium.last)
  end

  test "should show project_criterium" do
    get project_criterium_url(@project_criterium)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_criterium_url(@project_criterium)
    assert_response :success
  end

  test "should update project_criterium" do
    patch project_criterium_url(@project_criterium), params: { project_criterium: { name: @project_criterium.name, value: @project_criterium.value } }
    assert_redirected_to project_criterium_url(@project_criterium)
  end

  test "should destroy project_criterium" do
    assert_difference('ProjectCriterium.count', -1) do
      delete project_criterium_url(@project_criterium)
    end

    assert_redirected_to project_criteria_url
  end
end
