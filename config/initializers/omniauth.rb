OmniAuth.config.on_failure = lambda {|env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer, fields: [:email]
end
