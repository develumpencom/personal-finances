require "test_helper"

class MovementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:checking)
    @movement = movements(:one)
  end

  test "should get index" do
    get account_movements_url(@account)
    assert_response :success
  end

  test "should show movement" do
    get movement_url(@movement)
    assert_response :success
  end

  test "should get edit" do
    get edit_movement_url(@movement)
    assert_response :success
  end

  test "should update movement" do
    patch movement_url(@movement), params: { movement: { verified: @movement.verified } }
    assert_redirected_to movement_url(@movement)
  end

  test "should destroy movement" do
    assert_difference("Movement.count", -1) do
      delete movement_url(@movement)
    end

    assert_redirected_to account_url(@movement.account)
  end
end
