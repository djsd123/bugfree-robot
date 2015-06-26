class profiles::search {

  class { 'elasticsearch':
    manage_repo => true,
    repo_version=> '1.6',
  }

  elasticsearch::instance { 'drv-01': }

}
