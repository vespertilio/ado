# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ado_session',
  :secret      => 'a95505acf07d3d629ce66c11c511839c2d026c53b95e127d08c20c61578a676df8c003169d4648bf570c014a0fe8b50280d7cb4afaebeb288f58cce67d5a8554'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
