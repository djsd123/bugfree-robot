class profiles::env_variables {

  $REGISTER_TITLE_API      = hiera('register_title_api')
  $LOGGING_CONFIG_FILE_PATH= hiera('logging_config_file_path')
  $FAULT_LOG_FILE_PATH     = hiera('fault_log_file_path')
  $GOOGLE_ANALYTICS_API_KEY= hiera('google_analytics_api_key')
  $APPLICATION_SECRET_KEY  = hiera('application_secret_key')
  $LOGIN_API               = hiera('login_api')
#  $PYTHONPATH              = hiera('pythonpath')

  file { '/etc/profile.d/environment.sh' :
    ensure  => file,
    content => template('profiles/environment.sh.erb'),
  }
}