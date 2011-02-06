# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_project04_session',
  :secret      => 'f566ca1a590f481e188adb35fc13fe15bd953517281540b07cb1ac3ffa9312e71b9bba4bf2d39572a384091e02ad4dcdee15513f2fb4c13612b9503cae3736bd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
