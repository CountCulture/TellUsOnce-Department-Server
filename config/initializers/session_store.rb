# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tuo_recipient_session',
  :secret      => '5292c0f86fc8e009af11416c65f484577c111d4c761444ff6dc01bad357bc6f6faf8f309bf1e8c9e8ae5429dc1a72eb05ae399bab8099d1bfc5ac8aeae962792'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
