class profiles::env_variables {

  require profiles::users

  $jenkins_job             = hiera('jenkins_job')
  $app                     = hiera('app')
  $REGISTER_TITLE_API      = hiera('register_title_api')
  $LOGGING_CONFIG_FILE_PATH= "/var/webapp/workspace/${jenkins_job}/logging_config.json"
  $FAULT_LOG_FILE_PATH     = "/var/log/applications/${app}-fault.log"
  $GOOGLE_ANALYTICS_API_KEY= hiera('google_analytics_api_key')
  $APPLICATION_SECRET_KEY  = hiera('application_secret_key')
  $LOGIN_API               = hiera('login_api')
  $PYTHONPATH              = "/var/webapp/workspace/${jenkins_job}"
  $DIGITAL_REGISTER_URL    = hiera('digital_register_url')
  $SQLALCHEMY_DATABASE_URI = hiera('sqlalchemy_database_uri')
  $POSTGRES_PASSWORD       = hiera('postgres_password')
  $POSTGRES_HOST           = hiera('postgres_host')
  $ELASTIC_SEARCH_ENDPOINT = hiera('elastic_search_endpoint')
  $ELASTICSEARCH_URI       = hiera('elasticsearch_uri')



  file { 'environment_app.sh' :
    ensure  => file,
    content => template('profiles/environment.sh.erb'),
    path    => "/var/webapp/environment_app.sh",
    owner   => 'webapp',
    group   => 'webapp',
  }
}