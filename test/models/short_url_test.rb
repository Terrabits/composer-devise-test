require 'test_helper'

class ShortUrlTest < ActiveSupport::TestCase
  def setup
    @user  = users(:nick)
    @title = Faker::Lorem.sentence(3)
    @url   = Faker::Internet.url
  end

  test "should save valid short url" do
    short_url = @user.short_urls.build(title: @title, url: @url)
    assert_difference 'ShortUrl.count' do
      short_url.save
    end
    short_url.reload
    assert short_url.title == @title
    assert short_url.url   == @url
  end

  test "short url must reference user" do
    short_url = ShortUrl.create(title: @title, url: @user)
    assert_no_difference 'ShortUrl.count' do
      short_url.save
    end
    assert short_url.errors.any?
  end

  test "title is optional" do
    short_url = @user.short_urls.build(title: '', url: @url)
    assert_difference 'ShortUrl.count', 1 do
      short_url.save
    end
    assert_not short_url.errors.any?
    short_url.reload
    assert short_url.url == @url
  end

  test "url cannot be blank" do
    short_url = @user.short_urls.build(title: @title, url: "")
    assert_no_difference 'ShortUrl.count' do
      short_url.save
    end
    assert short_url.errors.any?
  end

  test "url must be valid" do
    short_url = @user.short_urls.build(title: @title, url: "invalid/url")
    assert_no_difference 'ShortUrl.count' do
      short_url.save
    end
    assert short_url.errors.any?
  end
end
