# frozen_string_literal: true
require 'oauth2'

module DropboxApi
  class Authenticator < OAuth2::Client
    def initialize(client_id, client_secret)
      super(client_id, client_secret, {
        authorize_url: 'https://www.dropbox.com/oauth2/authorize',
        token_url: 'https://api.dropboxapi.com/oauth2/token',
        # oauth2 2.0 defaults `auth_scheme` to `:basic_auth`, sending the
        # client credentials in the Authorization header. Dropbox expects them
        # in the request body, which was the oauth2 1.x default behaviour.
        auth_scheme: :request_body
      })
    end
  end
end
