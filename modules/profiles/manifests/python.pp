class profiles::python {

  class { 'python':
    version   => '3.4',
    pip       => true,
    dev       => true,
    virtualenv=> true,
    gunicorn  => true,

  }

}