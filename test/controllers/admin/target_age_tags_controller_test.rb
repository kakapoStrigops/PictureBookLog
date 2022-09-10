require "test_helper"

class Admin::TargetAgeTagsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_target_age_tags_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_target_age_tags_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_target_age_tags_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_target_age_tags_update_url
    assert_response :success
  end
end
