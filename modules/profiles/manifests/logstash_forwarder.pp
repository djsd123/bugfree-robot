class profiles::logstash_forwarder {

  $logstash_file = hiera('logstash_file')
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

  logstashforwarder::file { $logstash_file :
    paths  => [ "/var/log/applications/$app_log" ],
    fields => { 'type' => $app },
  }

}