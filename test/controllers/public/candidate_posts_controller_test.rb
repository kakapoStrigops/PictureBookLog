require "test_helper"

class Public::CandidatePostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_candidate_posts_index_url
    assert_response :success
  end

  test "should get update" do
    get public_candidate_posts_update_url
    assert_response :success
  end
end
