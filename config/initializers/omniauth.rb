Rails.application.config.middleware.use OmniAuth::Builder do
    provider :bnet, Rails.application.credentials.bnet[:client_id],
    Rails.application.credentials.bnet[:client_secret], scope: "wow.profile"
end
