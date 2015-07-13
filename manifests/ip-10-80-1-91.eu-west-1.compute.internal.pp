#Digital-Register-Frontend (Integration)
node 'ip-10-80-1-91.eu-west-1.compute.internal' {
  include '::roles::aws'
  include '::profiles::reverse_proxy'
  include '::profiles::drv_int_variables'

  logstashforwarder::file { 'nginx':
    paths  => [ '/var/log/nginx/access.log' ],
    fields => { 'type' => 'nginx-access' },
  }
}
