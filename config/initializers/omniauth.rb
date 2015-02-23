
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "5AVbcTupsuqVjFxQE9KyRXVve", "egfOjSKr9ox5h8F9aMtyDkVJUNkX2uWkEEMxBfAi5JoIuhLAWK"
  provider :facebook, '1408736612763073', '3858f8800e764cf0180d2e7cd777f915'
  provider :google_oauth2, '190943868501-dd1tkkhn6nqqamn6tjlo3k6hr2610q6p', 'CbXfZMulvdJ-3YtV0UtA_341'
end
