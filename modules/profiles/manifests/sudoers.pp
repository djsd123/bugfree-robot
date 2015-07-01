class profiles::sudoers {

# Admittedly hacky but just need Jenkins to work at this point.
# This would be better solved by creating customing images with something like packer.

  file { '/etc/sudoers':
    ensure  => file,
    source  => "puppet:///modules/profiles/sudoers",
    mode    => 440,
    owner   => 'root',
    group   => 'root',
  }

}