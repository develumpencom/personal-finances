require "application_system_test_case"

class AccountsTest < ApplicationSystemTestCase
  include SystemTestHelpers

  setup do
    @account = accounts(:checking)
    @user = @account.user
  end

  test "visiting the index" do
    sign_in(@user)

    visit accounts_url
    assert_selector "h1", text: "Accounts"
  end

  test "should create account" do
    sign_in(@user)

    visit accounts_url
    click_on "New account"

    fill_in "Name", with: @account.name
    click_on "Create Account"

    assert_text "Account was successfully created"
    click_on "Back"
  end

  test "should update Account" do
    sign_in(@user)

    visit account_url(@account)
    click_on "Edit this account", match: :first

    fill_in "Name", with: @account.name
    click_on "Update Account"

    assert_text "Account was successfully updated"
    click_on "Back"
  end

  test "should destroy Account" do
    sign_in(@user)

    visit account_url(@account)
    click_on "Destroy this account", match: :first

    assert_text "Account was successfully destroyed"
  end
end
