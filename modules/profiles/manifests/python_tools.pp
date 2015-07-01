class profiles::python_tools {

  require profiles::packages
# Python 3 setup\install

  $PYTHON   = 'lr-python3-3.4.3-1.x86_64'
  $PYPGK    = "${PYTHON}.rpm"
  $PKGMAN   = 'rpm'

  package {
    'python-pip':
      ensure      => installed,
      provider    => yum,
  }

  file {'LR Python package':
    ensure => 'file',
    path   => "/tmp/${PYPGK}",
    source => "puppet:///modules/profiles/${PYPGK}"
  }

# Install custom Python 3.4.3 build
  package { $PYTHON :
    ensure   => installed,
    provider => $PKGMAN,
    source   => "/tmp/${PYPGK}",
    require  => File['LR Python package']
  }

  file {'/usr/bin/pip3' :
    ensure => link,
    target => '/usr/local/bin/pip3',
  }

  package {'gunicorn' :
    ensure   => installed,
    provider => pip3,
    require  => File['/usr/bin/pip3']
  }

  package {['flask','virtualenv','virtualenvwrapper'] :
    ensure   => installed,
    provider => pip3,
    require  => File['/usr/bin/pip3'],
  }


}