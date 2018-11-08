require 'test_helper'

class VehicleSizesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehicle_size = vehicle_sizes(:one)
  end

  test "should get index" do
    get vehicle_sizes_url
    assert_response :success
  end

  test "should get new" do
    get new_vehicle_size_url
    assert_response :success
  end

  test "should create vehicle_size" do
    assert_difference('VehicleSize.count') do
      post vehicle_sizes_url, params: { vehicle_size: { code: @vehicle_size.code, description: @vehicle_size.description, name: @vehicle_size.name } }
    end

    assert_redirected_to vehicle_size_url(VehicleSize.last)
  end

  test "should show vehicle_size" do
    get vehicle_size_url(@vehicle_size)
    assert_response :success
  end

  test "should get edit" do
    get edit_vehicle_size_url(@vehicle_size)
    assert_response :success
  end

  test "should update vehicle_size" do
    patch vehicle_size_url(@vehicle_size), params: { vehicle_size: { code: @vehicle_size.code, description: @vehicle_size.description, name: @vehicle_size.name } }
    assert_redirected_to vehicle_size_url(@vehicle_size)
  end

  test "should destroy vehicle_size" do
    assert_difference('VehicleSize.count', -1) do
      delete vehicle_size_url(@vehicle_size)
    end

    assert_redirected_to vehicle_sizes_url
  end
end
