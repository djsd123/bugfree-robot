# Digital-Register-Feeder\Digital-Register-Elasticsearch-Updater (Integration)
node 'ip-10-80-2-46.eu-west-1.compute.internal' {
  include '::roles::aws'
  include '::profiles::search'

  logstashforwarder::file { 'digital-register-elasticsearch-updater':
    paths  => [ '/var/log/applications/digital-register-elasticsearch-updater.log' ],
    fields => { 'type' => 'digital-register-elasticsearch-updater' },
  }
}
