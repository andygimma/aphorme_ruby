Rails.application.config.middleware.use OmniAuth::Builder do
  # ...
  provider :twitter, "DAbQHE5Zuo5pdQa7pVPTA", "BHKpM8yvwQrUwxncCaaWFgqh4IIU1tu4xn5Jbz2vAg"
  provider :facebook, "390189764441786", "05f080d0032638669eb2b3842ab23f4d"
  provider :identity, on_failed_registration: lambda { |env|
    StaticPagesController.action(:signup).call(env)
  }
end