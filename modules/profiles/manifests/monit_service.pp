class profiles::monit_service{

  include monit

  monit::check { 'gunicorn':
    content => 'check process gunicorn with pidfile /tmp/gunicorn.pid
    start program = "/usr/bin/python3-gunicorn service.server:app --pid=/tmp/gunicorn.pid -c gunicorn_settings.py &"
    as uid webapp and gid webapp
    stop program = "/bin/pkill -9 gunicron"',
  }

}