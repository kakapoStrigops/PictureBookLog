require "test_helper"

class Admin::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admin_comments_update_url
    assert_response :success
  end
end
