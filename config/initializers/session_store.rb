# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_base_session',
  :secret      => '7dcf079e1afbabf6d09efc5b4377f2fafdcc4b81bda4d03fe42f77a2aaa65f3b55da5fa11720b3e9a56621f59228d2960fa21a39a674e7b4c4c854107534ea5a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
