require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  def setup
    @post = posts(:one)
  end
  
  test "should be valid" do
    assert @post.valid?
  end
  
  test "should not be blank" do
    @post.content = "        "
    assert_not @post.valid?
  end
  
  test "user should exist" do
    @post.user_id = 4300
    @post.save
    assert_not @post.valid?
  end
  
  test "content should not exceed 200-character limit" do
    @post.content = "a" * 200
    assert @post.valid?
    @post.content = "a" * 201
    assert_not @post.valid?
  end
  
  test "order should be most recent first" do
    assert_equal posts(:most_recent), Post.first
  end
end
