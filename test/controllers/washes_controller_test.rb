require 'test_helper'

class WashesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wash = washes(:one)
  end

  test "should get index" do
    get washes_url
    assert_response :success
  end

  test "should get new" do
    get new_wash_url
    assert_response :success
  end

  test "should create wash" do
    assert_difference('Wash.count') do
      post washes_url, params: { wash: { creation_date: @wash.creation_date, discount_amount: @wash.discount_amount, receipt_id: @wash.receipt_id, vehicle_id: @wash.vehicle_id, wash_type_id: @wash.wash_type_id, washer_id: @wash.washer_id } }
    end

    assert_redirected_to wash_url(Wash.last)
  end

  test "should show wash" do
    get wash_url(@wash)
    assert_response :success
  end

  test "should get edit" do
    get edit_wash_url(@wash)
    assert_response :success
  end

  test "should update wash" do
    patch wash_url(@wash), params: { wash: { creation_date: @wash.creation_date, discount_amount: @wash.discount_amount, receipt_id: @wash.receipt_id, vehicle_id: @wash.vehicle_id, wash_type_id: @wash.wash_type_id, washer_id: @wash.washer_id } }
    assert_redirected_to wash_url(@wash)
  end

  test "should destroy wash" do
    assert_difference('Wash.count', -1) do
      delete wash_url(@wash)
    end

    assert_redirected_to washes_url
  end
end
