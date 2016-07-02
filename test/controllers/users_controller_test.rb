require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @admin = users(:nick)
    @regular_user = users(:mike)
  end

  test "should redirect if not logged in" do
    sign_out
    get :index
    assert_redirected_to new_user_session_url
    get :show, id: @admin
    assert_redirected_to new_user_session_url
  end

  test "index should redirect if not admin" do
    sign_in @regular_user
    request.env['HTTP_REFERER'] = root_url
    get :index
    assert_redirected_to :back
  end

  test "show should redirect if not admin or current user" do
    sign_in @regular_user
    request.env['HTTP_REFERER'] = root_url
    get :show, id: @admin
    assert_redirected_to :back
  end

  test "user can show themselves" do
    sign_in @regular_user
    get :show, id: @regular_user
    assert_response :success
  end

  test "admin can access users list" do
    sign_in @admin
    get :index
    assert_response :success
  end

  test "admin can show user" do
    sign_in @admin
    get :show, id: @regular_user
    assert_response :success
  end

end
