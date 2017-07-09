require 'test_helper'

class PostCreationTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:one)
    @other_user = users(:two)
  end
  
  test "should reject post submission when not logged in" do
    assert_no_difference "Post.count" do
      post posts_path, params: { post: { content: "TEST POST" } }
    end
    follow_redirect!
    assert_template "sessions/new"
  end
  
  test "should allow post submission when logged in" do
    get login_path
    log_in_as @user
    assert_difference("Post.count", 1) do
      post posts_path, params: { post: { content: "TEST POST" } }
    end
    follow_redirect!
    assert_template "static_pages/home"
  end
  
  test "should ignore user_id parameter and proceed posting as the current logged in user" do
    get login_path
    log_in_as @user
    post posts_path, params: { post: { content: "TEST POST USER" } }
    assert_equal Post.first.user_id, @user.id
    delete logout_path
    get login_path
    log_in_as @other_user
    post posts_path, params: { post: { content: "TEST POST OTHER USER", user_id: 23 } }
    follow_redirect!
    assert_equal Post.first.user_id, @other_user.id
    assert_template "static_pages/home"
  end
end
