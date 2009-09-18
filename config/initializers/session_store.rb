# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_saasapp_session',
  :secret      => '10cc8b40b56f42907f88f4ad89173f6c657c25175baa4681e3f5f0676bc223c9a5b1d6e4947493f549a490ceb8234db914f88bc3b25eadade66f6c766d931376'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
