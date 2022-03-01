require "test_helper"

class MattressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mattress = mattresses(:one)
  end

  test "should get index" do
    get mattresses_url
    assert_response :success
  end

  test "should get new" do
    get new_mattress_url
    assert_response :success
  end

  test "should create mattress" do
    assert_difference("Mattress.count") do
      post mattresses_url, params: { mattress: { shop_id: @mattress.shop_id } }
    end

    assert_redirected_to mattress_url(Mattress.last)
  end

  test "should show mattress" do
    get mattress_url(@mattress)
    assert_response :success
  end

  test "should get edit" do
    get edit_mattress_url(@mattress)
    assert_response :success
  end

  test "should update mattress" do
    patch mattress_url(@mattress), params: { mattress: { shop_id: @mattress.shop_id } }
    assert_redirected_to mattress_url(@mattress)
  end

  test "should destroy mattress" do
    assert_difference("Mattress.count", -1) do
      delete mattress_url(@mattress)
    end

    assert_redirected_to mattresses_url
  end
end
