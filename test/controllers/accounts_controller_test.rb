require "test_helper"

class AccountsControllerTest < ActionDispatch::IntegrationTest
  include IntegrationTestHelpers

  setup do
    @account = accounts(:checking)
    @owner = @account.user
    @user = User.create(email_address: "user@email.com", password: "password")
  end

  test "should get index" do
    sign_in(@owner)

    get accounts_url
    assert_response :success
  end

  test "should get new" do
    sign_in(@owner)

    get new_account_url
    assert_response :success
  end

  test "should create account" do
    sign_in(@owner)

    assert_difference("Account.count") do
      post accounts_url, params: { account: { name: @account.name } }
    end

    assert_redirected_to account_url(Account.last)
  end

  test "should show account" do
    sign_in(@owner)

    get account_url(@account)
    assert_response :success
  end

  test "should get edit" do
    sign_in(@owner)

    get edit_account_url(@account)
    assert_response :success
  end

  test "should not get edit if not owner" do
    sign_in(@user)

    get edit_account_url(@account)
    assert_response :not_found
  end

  test "should update account" do
    sign_in(@owner)

    patch account_url(@account), params: { account: { name: @account.name } }
    assert_redirected_to account_url(@account)
  end

  test "should not update account if not owner" do
    sign_in(@user)

    patch account_url(@account), params: { account: { name: @account.name } }
    assert_response :not_found
  end

  test "should destroy account" do
    sign_in(@owner)

    assert_difference("Account.count", -1) do
      delete account_url(@account)
    end

    assert_redirected_to accounts_url
  end

  test "should not destroy account if not owner" do
    sign_in(@user)

    assert_no_difference("Account.count") do
      delete account_url(@account)
    end

    assert_response :not_found
  end
end
