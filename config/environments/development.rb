OurChorus::Application.configure do


  #logging and debugging
  config.whiny_nils = true
  config.active_support.deprecation = :log

  # Caching
  config.cache_classes = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Action Mailer
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :letter_opener
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }

   # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Assets
  config.assets.compress = false
  config.assets.debug = true
  config.assets.enabled = true
  config.serve_static_assets = true

end
