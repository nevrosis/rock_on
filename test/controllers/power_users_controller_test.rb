require 'test_helper'

class PowerUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get power_users_index_url
    assert_response :success
  end

  test "should get show" do
    get power_users_show_url
    assert_response :success
  end

  test "should get new" do
    get power_users_new_url
    assert_response :success
  end

  test "should get edit" do
    get power_users_edit_url
    assert_response :success
  end

  test "should get delete" do
    get power_users_delete_url
    assert_response :success
  end

end
