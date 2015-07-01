class profiles::monit_service{

  include monit

  monit::check { 'gunicorn':
    content => 'check process gunicorn with pidfile /tmp/gunicorn.pid
    start program = "/var/webapp/env_up"
    as uid webapp and gid webapp
    stop program = "/bin/pkill -9 python"
    if failed host localhost port 8000 protocol http then restart',
  }

}