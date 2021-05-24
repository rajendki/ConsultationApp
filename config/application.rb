require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AuditConsult
  class Application < Rails::Application
    config.active_job.queue_adapter = :sidekiq
    config.application_name = 'Online Consultation'
    config.action_mailer.raise_delivery_errors = true
      ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.gmail.com',
  :domain         => 'mail.google.com',
  :port           => 587,
  :user_name      => 'kishorer3196@gmail.com',
  :password       => 'gomavegeta',
  :authentication => :plain,
  :enable_starttls_auto => true
  }
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.middleware.insert_before ActionDispatch::Static, Rack::Cors do
  allow do
    origins '*'
    resource '*', :headers => :any, :methods => [:get, :post, :options]
  end
end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
