require "test_helper"

class ImportControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:checking)
  end

  test "should get new" do
    get new_account_imports_path(@account)
    assert_response :success
  end
end
