# Digital-Register-Feeder\Digital-Register-Elasticsearch-Updater (Integration)
node 'ip-10-80-2-46.eu-west-1.compute.internal' {
  include '::roles::aws'
  include '::profiles::search'

  logstashforwarder::file { 'digital-register-elasticsearch-updater':
    paths  => [ '/var/log/applications/digital-register-elasticsearch-updater.log' ],
    fields => { 'type' => 'digital-register-elasticsearch-updater' },
  }
# Usually it would make sense to capture and rotate the entire directory with a regex but the Elasticsearch Updater is
# very, very, very verbose and needs to be managed seperately until this is fixed.
# Pivotal Tracker: B44 - Improve logging in es updater
  logrotate::rule { 'digital-register-elasticsearch-updater':
    path    => "/var/log/applications/digital-register-elasticsearch-updater",
    rotate  => 10,
    size         => '100M',
    create       => true,
    create_owner => 'webapp',
    create_group => 'webapp',
    create_mode  => 755,
    compress     => true,
  }
}
