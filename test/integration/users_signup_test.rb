require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert-danger'
  end
  
  test "valid signup information" do
    user = User.new(name: "Valid", 
                   email: "uniqueuser84625@invalid.com",
                 password: "foovar", password_confirmation: "foovar")
         
    get signup_path
    assert_difference('User.count', 1) do
      post users_path, params: { user: { name:  user.name,
                                         email: user.email,
                                         password: user.password,
                                         password_confirmation: user.password_confirmation } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
    assert_select 'div#error_explanation', count: 0
    assert_not flash.empty?
  end
end
