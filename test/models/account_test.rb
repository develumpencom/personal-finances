require "test_helper"

class AccountTest < ActiveSupport::TestCase
  setup do
    @account = accounts(:one)
  end

  test "is valid" do
    assert @account.valid?
  end

  test "is invalid without name" do
    @account.name = nil

    assert_not @account.valid?
  end
end
