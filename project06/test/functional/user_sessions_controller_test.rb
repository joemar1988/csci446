require File.dirname(__FILE__) + '/../test_helper'
require 'user_sessions_controller'

# Re-raise errors caught by the controller.
class UserSessionsController; def rescue_action(e) raise e end; end

class UserSessionsControllerTest < ActionController::TestCase
  # Be sure to include AuthenticatedTestHelper in test/test_helper.rb instead
  # Then, you can remove it from this and the units test.
  include AuthenticatedTestHelper

  fixtures :user_sessions

  def test_should_allow_signup
    assert_difference 'UserSessions.count' do
      create_user_sessions
      assert_response :redirect
    end
  end

  def test_should_require_login_on_signup
    assert_no_difference 'UserSessions.count' do
      create_user_sessions(:login => nil)
      assert assigns(:user_sessions).errors.on(:login)
      assert_response :success
    end
  end

  def test_should_require_password_on_signup
    assert_no_difference 'UserSessions.count' do
      create_user_sessions(:password => nil)
      assert assigns(:user_sessions).errors.on(:password)
      assert_response :success
    end
  end

  def test_should_require_password_confirmation_on_signup
    assert_no_difference 'UserSessions.count' do
      create_user_sessions(:password_confirmation => nil)
      assert assigns(:user_sessions).errors.on(:password_confirmation)
      assert_response :success
    end
  end

  def test_should_require_email_on_signup
    assert_no_difference 'UserSessions.count' do
      create_user_sessions(:email => nil)
      assert assigns(:user_sessions).errors.on(:email)
      assert_response :success
    end
  end
  

  

  protected
    def create_user_sessions(options = {})
      post :create, :user_sessions => { :login => 'quire', :email => 'quire@example.com',
        :password => 'quire69', :password_confirmation => 'quire69' }.merge(options)
    end
end
