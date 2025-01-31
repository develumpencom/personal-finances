require "application_system_test_case"

class MovementsTest < ApplicationSystemTestCase
  include SystemTestHelpers

  setup do
    @account = accounts(:checking)
    @movement = movements(:one)
    @user = @account.user
  end

  test "visiting the index" do
    sign_in(@user)

    visit account_movements_url(@account)
    assert_selector "h1", text: "Movements"
  end

  test "should update Movement" do
    sign_in(@user)

    visit movement_url(@movement)
    click_on "Edit this movement", match: :first

    check "Verified" if @movement.verified
    click_on "Update Movement"

    assert_text "Movement was successfully updated"
    click_on "Back"
  end

  test "should destroy Movement" do
    sign_in(@user)

    visit movement_url(@movement)
    click_on "Destroy this movement", match: :first

    assert_text "Movement was successfully destroyed"
  end
end
