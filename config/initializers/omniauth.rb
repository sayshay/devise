
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "5AVbcTupsuqVjFxQE9KyRXVve", "egfOjSKr9ox5h8F9aMtyDkVJUNkX2uWkEEMxBfAi5JoIuhLAWK"
  provider :facebook, '1408736612763073', '3858f8800e764cf0180d2e7cd777f915'
  provider :google_oauth2, '190943868501-99agtrnasnqtj0ls8v7or5drbcp53njj.apps.googleusercontent.com', '2e8qpOeZK-c-okf4ThQeMmhX'
end
