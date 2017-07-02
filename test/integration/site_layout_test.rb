require 'test_helper'

class SiteLayoutTestTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 3
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    get contact_path
    assert_select "title", generate_title("Contact")
    get about_path
    assert_select "title", generate_title("About")
  end
  
  test "links available only to members" do
    user = users(:one)
    log_in_as user
    get root_path
    assert_select "a[href=?]", users_path
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(user)
    assert_select "a[href=?]", edit_user_path(user)
    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", users_path, 0
    assert_select "a[href=?]", logout_path, 0
    assert_select "a[href=?]", user_path(user), 0
    assert_select "a[href=?]", edit_user_path(user), 0
    
    
  end
end
