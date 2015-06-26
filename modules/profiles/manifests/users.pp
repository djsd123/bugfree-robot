class profiles::users {

  user {
    'webapp':
      ensure     => present,
      home       => '/var/webapp',
      shell      => '/bin/bash',
      uid        => '1003',
      managehome => true,
  }

  file {
    '/etc/sudoers.d/webapp':
      ensure  => file,
      source  => 'puppet:///modules/profiles/webapp',
      owner   => 'root',
      group   => 'root',
      mode    => '0644';
  }
}
