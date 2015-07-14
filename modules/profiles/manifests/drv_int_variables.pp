class profiles::drv_int_variables {

  $pypath    = hiera('pypath')
  $fault_log = hiera('fault_log')

  include systemenv

  $environment_variables = {
    'SETTINGS' => { ensure => present, value => '\'prod\'', },
    'REGISTER_TITLE_API' => { ensuren => present, value => 'http://digitalapi.integration2.beta.landregistryconcept.co.uk',},
    'LOGIN_API' => { ensure => present, value => 'http://loginapi.integration2.beta.landregistryconcept.co.uk',},
    'SESSION_COOKIE_SECURE' => { ensure => present, value => 'true',},
    'MORE_PROPRIETOR_DETAILS' => { ensure => present, value => 'true',},
    'DIGITAL_REGISTER_URL' => { ensure => present, value => 'http://digital.integration.beta.landregistryconcept.co.uk',},
    'GOOGLE_ANALYTICS_API_KEY' => { ensure => present, value => 'UA-59849906-2',},
    'APPLICATION_SECRET_KEY' => { ensure => present, value => 'secretkeyshouldberandom',},
    'PYTHONPATH' => { ensure => present, value => $pypath,},
    'LOGGING_CONFIG_FILE_PATH' => { ensure => present, value => 'logging_config.json',},
    'FAULT_LOG_FILE_PATH' => { ensure => present, value => $fault_log, },
    'SHOW_FULL_TITLE_DATA' => { ensure => present, value => 'true',},
  }

  create_resources(systemenv::var, $environment_variables)

}