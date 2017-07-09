require 'test_helper'

class HomepageLayoutTest < ActionDispatch::IntegrationTest
  
  def setup
    @post = posts(:one)
    @poster = @post.user
    @other_post = posts(:two)
    @other_poster = @other_post.user
  end
  
  test "should show paginated posts" do
    get root_path
    assert_select ".gravatar-block", 10
    assert_select ".post-block", 10
    assert_select "div.pagination", 1
  end
  
  test "should show posts with the posters' names hidden when not logged in" do
    get root_path
    assert_select "a[href=?]", user_path(@poster), 0
  end
  
  test "should show posts with the posters' names shown as a link when logged in" do
    log_in_as(@poster)
    get root_path
    assert_select "a[href=?]", user_path(@poster)
  end
  
  test "posts should not be paginated if all the results fit in one page" do
    Post.destroy_all
    get root_path
    assert_select "div.pagination", 0
  end
  
  test "should show form for creating posts when logged in" do
    log_in_as @poster
    get root_path
    assert_select 'form.new_post'
    delete logout_path
    get root_path
    assert_select 'form.new_post', 0
  end
  
  test "should not show login/signup reminder when already logged in" do
    get root_path
    assert_select "#reminder"
    log_in_as @poster
    get root_path
    assert_select "#reminder", 0
  end
  
  test "should contain delete links only to posts belonging to logged in user" do
    log_in_as @poster
    get root_path
    assert_select "a[href=?]", post_path(@post), text: "delete"
    assert_select "a[href=?]", post_path(@other_post), text: "delete", count: 0
  end
end
