Sidekiq.configure_server do |config|
  config.redis = { :namespace => 'linus_workers' }
end

Sidekiq.configure_client do |config|
  config.redis = { :namespace => 'linus_workers' }
end