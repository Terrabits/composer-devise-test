require 'test_helper'

class ShortUrlTest < ActiveSupport::TestCase
  def setup
    @user  = users(:nick)
    @title = Faker::Lorem.sentence(3)
    @url   = Faker::Internet.url
  end

  test "title is optional" do
    short_url = @user.short_urls.build(title: '', url: @url)
    assert short_url.valid?
    assert_not short_url.errors.any?
  end

  test "url cannot be blank" do
    short_url = @user.short_urls.build(title: @title, url: "")
    assert_not short_url.valid?
    assert short_url.errors.any?
  end
end
