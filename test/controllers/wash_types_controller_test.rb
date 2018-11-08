require 'test_helper'

class WashTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wash_type = wash_types(:one)
  end

  test "should get index" do
    get wash_types_url
    assert_response :success
  end

  test "should get new" do
    get new_wash_type_url
    assert_response :success
  end

  test "should create wash_type" do
    assert_difference('WashType.count') do
      post wash_types_url, params: { wash_type: { code: @wash_type.code, description: @wash_type.description, name: @wash_type.name } }
    end

    assert_redirected_to wash_type_url(WashType.last)
  end

  test "should show wash_type" do
    get wash_type_url(@wash_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_wash_type_url(@wash_type)
    assert_response :success
  end

  test "should update wash_type" do
    patch wash_type_url(@wash_type), params: { wash_type: { code: @wash_type.code, description: @wash_type.description, name: @wash_type.name } }
    assert_redirected_to wash_type_url(@wash_type)
  end

  test "should destroy wash_type" do
    assert_difference('WashType.count', -1) do
      delete wash_type_url(@wash_type)
    end

    assert_redirected_to wash_types_url
  end
end
