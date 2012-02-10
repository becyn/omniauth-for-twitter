Rails.application.config.middleware.use OmniAuth::Builder do
  config = Rails.application.config.twitter["development"]
  provider :twitter, config["consumer_key"], config["consumer_secret"]
end
