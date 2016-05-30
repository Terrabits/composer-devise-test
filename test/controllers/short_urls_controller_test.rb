require 'test_helper'

class ShortUrlsControllerTest < ActionController::TestCase
  def setup
    @user        = users(:nick)
    @title       = Faker::Lorem.sentence(3)
    @url         = Faker::Internet.url
    @invalid_url = "invalid/url"
    sign_in @user
  end

  test "should create short_url" do
    request.env['HTTP_REFERER'] = root_url
    assert_difference('ShortUrl.count') do
      post :create, short_url: { title: @title, url: @url }
    end

  end

  test "should not create short_url if not logged in" do
    sign_out
    assert_no_difference('ShortUrl.count') do
      request.env['HTTP_REFERER'] = root_url
      post :create, short_url: { title: @title, url: @url }
    end
    assert_redirected_to new_user_session_url
  end

  test "should redirect if invalid short url" do
    assert_no_difference('ShortUrl.count') do
      request.env['HTTP_REFERER'] = root_url
      post :create, short_url: { title: @title, url: @invalid_url }
    end
    assert_redirected_to :back
  end
end
