require 'test_helper'

class CreditNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @credit_note = credit_notes(:one)
  end

  test "should get index" do
    get credit_notes_url
    assert_response :success
  end

  test "should get new" do
    get new_credit_note_url
    assert_response :success
  end

  test "should create credit_note" do
    assert_difference('CreditNote.count') do
      post credit_notes_url, params: { credit_note: { creation_date: @credit_note.creation_date, informed_gross_amount: @credit_note.informed_gross_amount, receipt_id: @credit_note.receipt_id, sii_status: @credit_note.sii_status } }
    end

    assert_redirected_to credit_note_url(CreditNote.last)
  end

  test "should show credit_note" do
    get credit_note_url(@credit_note)
    assert_response :success
  end

  test "should get edit" do
    get edit_credit_note_url(@credit_note)
    assert_response :success
  end

  test "should update credit_note" do
    patch credit_note_url(@credit_note), params: { credit_note: { creation_date: @credit_note.creation_date, informed_gross_amount: @credit_note.informed_gross_amount, receipt_id: @credit_note.receipt_id, sii_status: @credit_note.sii_status } }
    assert_redirected_to credit_note_url(@credit_note)
  end

  test "should destroy credit_note" do
    assert_difference('CreditNote.count', -1) do
      delete credit_note_url(@credit_note)
    end

    assert_redirected_to credit_notes_url
  end
end
