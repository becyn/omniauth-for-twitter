Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter,"Consumer key","Consumer secret"
end
