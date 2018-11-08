require "application_system_test_case"

class ReconciliationsTest < ApplicationSystemTestCase
  setup do
    @reconciliation = reconciliations(:one)
  end

  test "visiting the index" do
    visit reconciliations_url
    assert_selector "h1", text: "Reconciliations"
  end

  test "creating a Reconciliation" do
    visit reconciliations_url
    click_on "New Reconciliation"

    fill_in "Amount Assigned From Payment To Receipt", with: @reconciliation.amount_assigned_from_payment_to_receipt
    fill_in "Payment", with: @reconciliation.payment_id
    fill_in "Receipt", with: @reconciliation.receipt_id
    click_on "Create Reconciliation"

    assert_text "Reconciliation was successfully created"
    click_on "Back"
  end

  test "updating a Reconciliation" do
    visit reconciliations_url
    click_on "Edit", match: :first

    fill_in "Amount Assigned From Payment To Receipt", with: @reconciliation.amount_assigned_from_payment_to_receipt
    fill_in "Payment", with: @reconciliation.payment_id
    fill_in "Receipt", with: @reconciliation.receipt_id
    click_on "Update Reconciliation"

    assert_text "Reconciliation was successfully updated"
    click_on "Back"
  end

  test "destroying a Reconciliation" do
    visit reconciliations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reconciliation was successfully destroyed"
  end
end
