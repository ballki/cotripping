OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '299911060178158', 'ac10f6fa59604c2dc3f979d3ff2f7257'
end