# config/application.rb

require_relative 'boot'

require 'rails/all'
Bundler.require(*Rails.groups)

module SearchAnalyticsBackend
  class Application < Rails::Application
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'  # Adjust this to your frontend's origin if needed
        resource '*',
                 headers: :any,
                 methods: [:get, :post, :options]
      end
    end
  end
end
