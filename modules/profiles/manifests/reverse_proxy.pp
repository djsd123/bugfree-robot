class profiles::reverse_proxy {

  class {'nginx':}

  file {'/etc/nginx/conf.d/reverse_proxy.conf':
    ensure  => file,
    content => epp('profiles/proxy.conf.epp'),
    owner   =>
    group   =>


  }

}