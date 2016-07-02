require 'test_helper'

class HomeNavigationTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:nick)
    @regular_user = users(:mike)
  end

  test "users link for admin" do
    sign_in @admin, password: "foobar"
    get root_path
    assert_template "visitors/index"
    assert_select "a[href=?]", "/users", text: "Users"
  end

  test "account link for regular user" do
    sign_in @regular_user, password: "foobar"
    get root_path
    assert_template "visitors/index"
    assert_select "a[href=?]", user_path(@regular_user), text: "URLs"
  end
end
