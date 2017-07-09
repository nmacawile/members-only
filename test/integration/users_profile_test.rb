require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:one)
  end
  
  test "should show paginated user posts when logged in" do
    log_in_as @user
    get user_path(@user)
    assert_select '.gravatar-block'
    assert_select '.post-block'
  end
  
  test "should hide all user posts when not logged in" do
    get user_path(@user)
    assert_select '.gravatar-block', 0
    assert_select '.post-block', 0
  end
end
