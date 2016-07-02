require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @admin = users(:nick)
    @regular_user = users(:mike)
  end

  test "has many short urls" do
    assert @admin.short_urls.count > 0
  end

  test "regular user is not admin" do
    assert_not @regular_user.admin?
  end

  test "admin is an admin" do
    assert @admin.admin?
  end
end
