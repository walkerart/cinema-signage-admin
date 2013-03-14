CinemaWall::Application.configure do
  config.cache_classes = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.serve_static_assets = true
  config.assets.compress = true
  config.assets.compile = true
  config.assets.initialize_on_precompile = true
  config.assets.digest = true

  config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.active_record.auto_explain_threshold_in_seconds = 0.5
end
