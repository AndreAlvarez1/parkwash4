require "application_system_test_case"

class WashTypesTest < ApplicationSystemTestCase
  setup do
    @wash_type = wash_types(:one)
  end

  test "visiting the index" do
    visit wash_types_url
    assert_selector "h1", text: "Wash Types"
  end

  test "creating a Wash type" do
    visit wash_types_url
    click_on "New Wash Type"

    fill_in "Code", with: @wash_type.code
    fill_in "Description", with: @wash_type.description
    fill_in "Name", with: @wash_type.name
    click_on "Create Wash type"

    assert_text "Wash type was successfully created"
    click_on "Back"
  end

  test "updating a Wash type" do
    visit wash_types_url
    click_on "Edit", match: :first

    fill_in "Code", with: @wash_type.code
    fill_in "Description", with: @wash_type.description
    fill_in "Name", with: @wash_type.name
    click_on "Update Wash type"

    assert_text "Wash type was successfully updated"
    click_on "Back"
  end

  test "destroying a Wash type" do
    visit wash_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Wash type was successfully destroyed"
  end
end
