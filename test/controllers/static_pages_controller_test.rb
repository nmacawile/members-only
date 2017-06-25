require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Members Only!"
  end

  test "should get about" do
    get about_url
    assert_response :success
    assert_select "title", "About | Members Only!"
  end

  test "should get help" do
    get help_url
    assert_response :success
    assert_select "title", "Help | Members Only!"
  end

end
