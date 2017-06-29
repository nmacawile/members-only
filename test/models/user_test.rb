require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(    name: "Test User",
                        email: "testuser@testemail.com",
                     password: "foobar", password_confirmation: "foobar")
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end
  
  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end
  
  test "name should not be too long" do
    @user.name = "a"*50
    assert @user.valid?
    @user.name = "a"*51
    assert_not @user.valid?
  end
  
  test "email should not be too long" do
    @user.email = "#{"a"*247}@aa.com"
    assert @user.valid?
    @user.email = "#{"a"*248}@aa.com"
    assert_not @user.valid?
  end
  
  test "should reject invalid email format" do
    invalid_emails = %w(
                    foo
                    'foo baz@bar.com'
                    foo@bar
                    @bar.com
                    bar.com
                    foo@bar.
                    foo@bar..com
                    @foo@bar.com
                    )
    invalid_emails.each do |email|
      @user.email = email
      assert_not @user.valid?
    end
  end
  
  test "should accept valid email format" do
    valid_emails = %w(
                    foo@bar.com
                    foo12@bar.com
                    foo@bar.co.jp
                    foo-bar.@bar.com
                    foo-bar@bar.com
                    foo_baz@bar.com
                    foo.baz@bar.com
                    )
    valid_emails.each do |email|
      @user.email = email
      assert @user.valid?
    end
  end
  
  test "email should be unique" do
    new_user = User.new(name: "New User", email: "TestUser@TestEmail.com")
    @user.save
    assert_not new_user.valid?
  end
  
  test "email should be saved as lower-case" do
    @user.email = "TesTUsEr@TestEmaiL.Com"
    @user.save
    @user.reload
    assert_equal @user.email, "testuser@testemail.com"
  end
  
  test "password should be present" do
    @user.password = @user.password_confirmation = " " * 10
    assert_not @user.valid?
  end
  
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
  
  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?('')
  end
end
