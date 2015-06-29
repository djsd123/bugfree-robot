class profiles::users {
  
  $webapp_dirs = ["/var/webapp/.ssh","/var/webapp/workspace"]

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
  
  file { $webapp_dirs :
    ensure  => directory,
    owner   => 'webapp',
    group   => 'webapp',
    mode    => 700,
  }

  file { '/var/webapp/.ssh/authorized_keys':
    ensure  => file,
    source  => 'puppet:///modules/profiles/authorized_keys',
    owner   => 'webapp',
    group   => 'webapp',
    mode    => 644,
  }
  
}
