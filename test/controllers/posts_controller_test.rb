require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @post = posts(:one)
    @poster = @post.user
    @other_post = posts(:two)
    @other_poster = @other_post.user
  end
  
  test "should redirect post submission when not logged in" do
    post posts_path, params: { post: { content: "TEST POST" } }
    assert_not flash.empty?
    assert_redirected_to login_path
  end
  
  test "should reject post deletion when not logged in" do
    assert_no_difference "Post.count" do
      delete post_path(@post)
    end
    assert_not flash.empty?
    assert_redirected_to login_path
  end
  
  test "should reject post deletion when not logged in as the post creator" do
    log_in_as @other_poster
    assert_no_difference "Post.count" do
      delete post_path(@post)
    end
    assert_not flash.empty?
    assert_redirected_to root_path
  end
  
  test "should allow post deletion when logged in as the post creator" do
    log_in_as @poster
    assert_difference("Post.count", -1) do
      delete post_path(@post)
    end
    assert_not flash.empty?
    assert_redirected_to @poster
  end
end
