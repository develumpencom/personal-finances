require "test_helper"

class MovementsControllerTest < ActionDispatch::IntegrationTest
  include IntegrationTestHelpers

  setup do
    @account = accounts(:checking)
    @movement = movements(:one)
    @owner = @account.user
    @user = User.create(email_address: "user@email.com", password: "password")
  end

  test "should get index" do
    sign_in(@owner)


    get account_movements_url(@account)
    assert_response :success
  end

  test "should show movement" do
    sign_in(@owner)


    get movement_url(@movement)
    assert_response :success
  end

  test "should get edit" do
    sign_in(@owner)

    get edit_movement_url(@movement)
    assert_response :success
  end

  test "should not get edit if not owner" do
    sign_in(@user)

    get edit_movement_url(@movement)
    assert_response :not_found
  end

  test "should update movement" do
    sign_in(@owner)

    patch movement_url(@movement), params: { movement: { verified: @movement.verified } }
    assert_redirected_to movement_url(@movement)
  end

  test "should not update movement if not owner" do
    sign_in(@user)

    patch movement_url(@movement), params: { movement: { verified: @movement.verified } }
    assert_response :not_found
  end

  test "should destroy movement" do
    sign_in(@owner)

    assert_difference("Movement.count", -1) do
      delete movement_url(@movement)
    end

    assert_redirected_to account_url(@movement.account)
  end

  test "should not destroy movement if not owner" do
    sign_in(@user)

    assert_no_difference("Movement.count") do
      delete movement_url(@movement)
    end

    assert_response :not_found
  end
end
