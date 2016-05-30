require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @user = users(:nick)
    sign_in @user
  end

  test "should redirect if not logged in" do
    sign_out
    get :index
    assert_redirected_to new_user_session_url
    get :show, id: @user
    assert_redirected_to new_user_session_url
  end

  test "show should redirect if not current user" do
    request.env['HTTP_REFERER'] = root_url
    get :show, id: users(:mike)
    assert_redirected_to :back
  end
end
