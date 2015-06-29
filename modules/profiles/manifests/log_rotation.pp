class profiles::log_rotation {

  $app    = hiera('app')

  logrotate::rule { $app :
    path         => "/var/log/applications/${app}.log",
    rotate       => 10,
    rotate_every => 'day',
#   size         => '100M',
    create       => true,
    create_owner => 'webapp',
    create_group => 'webapp',
    create_mode  => 755,
    compress     => true,
  }

}