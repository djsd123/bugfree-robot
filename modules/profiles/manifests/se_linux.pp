class profiles::se_linux {

  class { selinux:
    mode => 'permissive',
  }
}