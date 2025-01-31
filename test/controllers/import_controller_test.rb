require "test_helper"

class ImportControllerTest < ActionDispatch::IntegrationTest
  include IntegrationTestHelpers

  setup do
    @account = accounts(:checking)
  end

  test "should get new" do
    sign_in(@account.user)

    get new_account_imports_path(@account)
    assert_response :success
  end
end
