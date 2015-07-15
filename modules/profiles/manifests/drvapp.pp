class profiles::drvapp {
# The implemetation of this definitely needs to be revisted and aligned with a proper packaging and deployment solution
  require profiles::users
  $app    = hiera('app')

  file { '/var/webapp/env_up.sh':
    ensure  => file,
    content => template('profiles/env_up.sh.erb'),
    owner   => 'webapp',
    group   => 'webapp',
    mode    => 755,
  }

}