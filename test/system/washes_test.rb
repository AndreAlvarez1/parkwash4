require "application_system_test_case"

class WashesTest < ApplicationSystemTestCase
  setup do
    @wash = washes(:one)
  end

  test "visiting the index" do
    visit washes_url
    assert_selector "h1", text: "Washes"
  end

  test "creating a Wash" do
    visit washes_url
    click_on "New Wash"

    fill_in "Creation Date", with: @wash.creation_date
    fill_in "Discount Amount", with: @wash.discount_amount
    fill_in "Receipt", with: @wash.receipt_id
    fill_in "Vehicle", with: @wash.vehicle_id
    fill_in "Wash Type", with: @wash.wash_type_id
    fill_in "Washer", with: @wash.washer_id
    click_on "Create Wash"

    assert_text "Wash was successfully created"
    click_on "Back"
  end

  test "updating a Wash" do
    visit washes_url
    click_on "Edit", match: :first

    fill_in "Creation Date", with: @wash.creation_date
    fill_in "Discount Amount", with: @wash.discount_amount
    fill_in "Receipt", with: @wash.receipt_id
    fill_in "Vehicle", with: @wash.vehicle_id
    fill_in "Wash Type", with: @wash.wash_type_id
    fill_in "Washer", with: @wash.washer_id
    click_on "Update Wash"

    assert_text "Wash was successfully updated"
    click_on "Back"
  end

  test "destroying a Wash" do
    visit washes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Wash was successfully destroyed"
  end
end
