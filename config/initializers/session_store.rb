# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_raceweb_auth_session',
  :secret      => 'afd799299665370f43c84527df120f9810a3420c937121b1bbc745d9c2ceae4d89738cfd82e073d5ba0fcb11b6b45790469c333c1a5279885688aa1fa65f4794'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
