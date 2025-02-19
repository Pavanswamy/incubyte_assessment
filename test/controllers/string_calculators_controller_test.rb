require 'test_helper'

class StringCalculatorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success
  end

  test "index should assign flash result when set" do
    get root_url
    flash[:result] = "10"
    assert_response :success
    assert_equal "10", flash[:result]
  end

  test "index should assign flash error when set" do
    get root_url
    flash[:error] = "Error message"
    assert_response :success
    assert_equal "Error message", flash[:error]
  end

  test "calculate with empty string should return 0" do
    post calculate_url, params: { numbers: '' }
    assert_response :redirect
    assert_redirected_to root_url
    assert_equal "0", flash[:result].to_s
  end

  test "calculate with comma separated numbers" do
    post calculate_url, params: { numbers: '1,2' }
    assert_response :redirect
    assert_redirected_to root_url
    assert_equal "3", flash[:result].to_s
  end

  test "calculate with negative numbers should raise error" do
    post calculate_url, params: { numbers: '1,-2' }
    assert_response :redirect
    assert_redirected_to root_url
    assert_equal "negative numbers not allowed: -2", flash[:error]
  end

  # test "calculate with custom delimiter" do
  #   post calculate_url, params: { numbers: '//;\n1;2' }
  #   assert_response :redirect
  #   assert_redirected_to root_url
  #   assert_equal "3", flash[:result].to_s
  # end

  # test "calculate with multiple numbers and newlines" do
  #   post calculate_url, params: { numbers: '1\n2,3' }
  #   assert_response :redirect
  #   assert_redirected_to root_url
  #   assert_equal "6", flash[:result].to_s
  # end
end