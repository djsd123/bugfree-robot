class profiles::reverse_proxy {

  require profiles::packages

  $server_name  =  hiera('server_name')
  $sslcrt       =  hiera('sslcrt')
  $sslkey       =  hiera('sslkey')
  $proxy_pass   =  hiera('proxy_pass')

  package { 'nginx':
    ensure  => installed,
  } ->
  file { '/etc/nginx/conf.d/reverse_proxy.conf':
    ensure  => file,
    content => template('profiles/proxy.conf.erb'),
    owner   => 'nginx',
    group   => 'nginx',
    require => Package['nginx'],
  } ~>

  file { $sslkey :
    ensure  => file,
    source  => "puppet:///modules/profiles/ssl.pem",
    owner   => 'root',
    group   => 'root',
    require => Package['nginx'],
  } ~>
  file { $sslcrt :
    ensure  => file,
    source  => "puppet:///modules/profiles/ssl1.pem",
    owner   => 'nginx',
    group   => 'nginx',
  } ~>
  service { 'nginx':
    ensure    => running,
    subscribe => File['/etc/nginx/conf.d/reverse_proxy.conf'],
  }

}
