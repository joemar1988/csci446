require File.dirname(__FILE__) + '/../test_helper'

class UserSessionsTest < ActiveSupport::TestCase
  # Be sure to include AuthenticatedTestHelper in test/test_helper.rb instead.
  # Then, you can remove it from this and the functional test.
  include AuthenticatedTestHelper
  fixtures :user_sessions

  def test_should_create_user_sessions
    assert_difference 'UserSessions.count' do
      user_sessions = create_user_sessions
      assert !user_sessions.new_record?, "#{user_sessions.errors.full_messages.to_sentence}"
    end
  end

  def test_should_require_login
    assert_no_difference 'UserSessions.count' do
      u = create_user_sessions(:login => nil)
      assert u.errors.on(:login)
    end
  end

  def test_should_require_password
    assert_no_difference 'UserSessions.count' do
      u = create_user_sessions(:password => nil)
      assert u.errors.on(:password)
    end
  end

  def test_should_require_password_confirmation
    assert_no_difference 'UserSessions.count' do
      u = create_user_sessions(:password_confirmation => nil)
      assert u.errors.on(:password_confirmation)
    end
  end

  def test_should_require_email
    assert_no_difference 'UserSessions.count' do
      u = create_user_sessions(:email => nil)
      assert u.errors.on(:email)
    end
  end

  def test_should_reset_password
    user_sessions(:quentin).update_attributes(:password => 'new password', :password_confirmation => 'new password')
    assert_equal user_sessions(:quentin), UserSessions.authenticate('quentin', 'new password')
  end

  def test_should_not_rehash_password
    user_sessions(:quentin).update_attributes(:login => 'quentin2')
    assert_equal user_sessions(:quentin), UserSessions.authenticate('quentin2', 'monkey')
  end

  def test_should_authenticate_user_sessions
    assert_equal user_sessions(:quentin), UserSessions.authenticate('quentin', 'monkey')
  end

  def test_should_set_remember_token
    user_sessions(:quentin).remember_me
    assert_not_nil user_sessions(:quentin).remember_token
    assert_not_nil user_sessions(:quentin).remember_token_expires_at
  end

  def test_should_unset_remember_token
    user_sessions(:quentin).remember_me
    assert_not_nil user_sessions(:quentin).remember_token
    user_sessions(:quentin).forget_me
    assert_nil user_sessions(:quentin).remember_token
  end

  def test_should_remember_me_for_one_week
    before = 1.week.from_now.utc
    user_sessions(:quentin).remember_me_for 1.week
    after = 1.week.from_now.utc
    assert_not_nil user_sessions(:quentin).remember_token
    assert_not_nil user_sessions(:quentin).remember_token_expires_at
    assert user_sessions(:quentin).remember_token_expires_at.between?(before, after)
  end

  def test_should_remember_me_until_one_week
    time = 1.week.from_now.utc
    user_sessions(:quentin).remember_me_until time
    assert_not_nil user_sessions(:quentin).remember_token
    assert_not_nil user_sessions(:quentin).remember_token_expires_at
    assert_equal user_sessions(:quentin).remember_token_expires_at, time
  end

  def test_should_remember_me_default_two_weeks
    before = 2.weeks.from_now.utc
    user_sessions(:quentin).remember_me
    after = 2.weeks.from_now.utc
    assert_not_nil user_sessions(:quentin).remember_token
    assert_not_nil user_sessions(:quentin).remember_token_expires_at
    assert user_sessions(:quentin).remember_token_expires_at.between?(before, after)
  end

protected
  def create_user_sessions(options = {})
    record = UserSessions.new({ :login => 'quire', :email => 'quire@example.com', :password => 'quire69', :password_confirmation => 'quire69' }.merge(options))
    record.save
    record
  end
end
