if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_app_session', domain: ''
else
  Rails.application.config.session_store :cookie_store, key: '_app_session'
end
