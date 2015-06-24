class profiles::reverse_proxy {

  require ::nginx

  $server_name  =  hiera('server_name')
  $sslcrt       =  hiera('sslcrt')
  $sslkey       =  hiera('sslkey')
  $proxy_pass   =  hiera('proxy_pass')


  file {'/etc/nginx/conf.d/reverse_proxy.conf':
    ensure  => file,
    content => template('profiles/proxy.conf.erb'),
    owner   => 'nginx',
    group   => 'nginx',
  }

  file {['$sslcrt','$sslkey']:
    ensure  => file,
    source  => ["puppet:///profiles/ssl.crt",
                "puppet:///profiles/ssl.key"
    ],
    owner   => 'nginx',
    group   => 'nginx',

  }

}