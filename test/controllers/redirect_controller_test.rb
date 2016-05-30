require 'test_helper'

class RedirectControllerTest < ActionController::TestCase
  def setup
    @user = users(:nick)
    @short_url = @user.short_urls.first
  end
  test "should redirect to url" do
    get :to_url, id: @short_url.shorten
    assert_redirected_to @short_url.url
  end

end
