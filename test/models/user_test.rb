require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:nick)
  end

  test "has many short urls" do
    assert @user.short_urls.count > 0
  end
end
