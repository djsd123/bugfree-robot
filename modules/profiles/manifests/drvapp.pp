class profiles::drvapp {
# The implemetation of this definitely needs to be revisted and aligned with a proper packaging and deployment solution
  include profiles::users
  $app          = hiera('app')
  $jenkins_job  = hiera('jenkins_job')

  file { '/var/webapp/env_up.sh':
    ensure  => file,
    content => template('profiles/env_up.sh.erb'),
    owner   => 'webapp',
    group   => 'webapp',
    mode    => 755,
  }


  file { 'project_root':
    path    => "/var/webapp/workspace/${jenkins_job}",
    ensure  => directory,
    owner   => 'webapp',
    group   => 'webapp',
    mode    => 775,
  }

  /*file { $app:
    ensure  => link,
    target  => "/var/webapp/workspace/${jenkins_job}",
    path    => "/var/webapp",
    owner   => 'webapp',
    group   => 'webapp',
  }
*/
}