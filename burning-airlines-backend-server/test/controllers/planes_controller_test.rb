require 'test_helper'

class PlanesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get planes_index_url
    assert_response :success
  end

  test "should get show" do
    get planes_show_url
    assert_response :success
  end

  test "should get new" do
    get planes_new_url
    assert_response :success
  end

  test "should get edit" do
    get planes_edit_url
    assert_response :success
  end

  test "should get create" do
    get planes_create_url
    assert_response :success
  end

  test "should get update" do
    get planes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get planes_destroy_url
    assert_response :success
  end

end
