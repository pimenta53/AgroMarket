OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  #provider, id, secret
  provider :facebook, '547514635336381', '037623bb1bd76b7b9e550213cd3c22b4'
  provider :twitter, 'Hl0gtbxf9mMB5sGd37VtA', '8793bRFsdZsZGPOcZnWCdKDXDdU76WQX09d8tUc5Po'
  provider :google_oauth2, '611864901662.apps.googleusercontent.com', 'OtA8_4UzYIZWBRcAwhOU67k2'
  #provider :open_id, OpenID::Store::Filesystem.new('/tmp')
end

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}