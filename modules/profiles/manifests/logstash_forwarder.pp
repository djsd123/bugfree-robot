class profiles::logstash_forwarder {

  $app_log       = hiera('app_log')
  $app           = hiera('app')
  $servers       = hiera('servers')
  $ssl_ca        = hiera('ssl_ca')

  class { 'logstashforwarder':
    manage_repo => true,
    servers     => $servers,
    timeout     => '15',
    ssl_ca      => $ssl_ca,
  }

  logstashforwarder::file { $app :
    paths  => [ "/var/log/applications/$app_log" ],
    fields => { 'type' => $app },
  }

  file { '/etc/pki/tls/certs/logstash-forwarder.crt':
    ensure => file,
    source => "puppet:///modules/profiles/logstash-forwarder.crt",
    mode   => '644',
    owner  => 'logstashforwarder',
    group  => 'logstashforwarder',
  }

}