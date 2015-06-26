class profiles::logstash_forwarder {

  class {'logstashforwarder':
    manage_repo => true,
    servers     => $servers,
    timeout     => '15',
    ssl_ca      => $ssl_ca,
  }

}