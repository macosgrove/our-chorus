OurChorus::Application.configure do

  #logging and debugging
  config.active_support.deprecation = :notify
  #config.active_support.deprecation = :log

   # Caching
  #config.cache_classes = false
  config.consider_all_requests_local       = false
  #config.consider_all_requests_local       = true
  config.action_controller.perform_caching = true
  #config.action_controller.perform_caching = false

  # Action Mailer
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :letter_opener
  config.action_mailer.default_url_options = { :host => 'ourchorus_staging.herokuapp.com/' }
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :address        => "smtp.sendgrid.net",
    :port           => "25",
    :authentication => :plain,
    :user_name      => ENV['SENDGRID_USERNAME'],
    :password       => ENV['SENDGRID_PASSWORD'],
    :domain         => ENV['SENDGRID_DOMAIN']
  }

  # Enable threaded mode
  # config.threadsafe!

  # Internationalisation
  config.i18n.fallbacks = true


   # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Assets
  #config.assets.compress = false
  config.assets.compress = true
  #config.assets.debug = true
  #config.serve_static_assets = false
  config.serve_static_assets = true
  config.assets.initialize_on_precompile = false
  config.assets.compile = true

  # Generate digests for assets URLs
  config.assets.digest = true
end