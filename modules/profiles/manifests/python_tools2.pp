class profiles::python_tools2 {

# Very ugly approach, I know.  I am experimenting with using python packages system wide as opposed to virtualenvs
# which are not relocatable.

  $rpm_path   =  "puppet:///modules/profiles"
  $gunicorn   =  "python3-gunicorn-18.0-1.fc20.noarch.rpm"
  $python3    =  "python3-3.3.2-19.fc20.x86_64.rpm"
  $pip        =  "python3-pip-1.4.1-1.fc20.noarch.rpm"
  $setuptools =  "python3-setuptools-1.4.2-1.fc20.noarch.rpm"
  $libs       =  "python3-libs-3.3.2-19.fc20.x86_64.rpm"

  file { $setuptools :
    ensure   => file,
    path     => "/tmp/${setuptools}",
    source   => "${rpm_path}/${setuptools}",
  } ~>

  package { $setuptools :
    provider => rpm,
    source   => "/tmp/${setuptools}",
    ensure   => installed,
  }

  file { $libs :
    ensure   => file,
    path     => "/tmp/${libs}",
    source   => "${rpm_path}/${libs}",
  } ~>

  package { $libs :
    provider => rpm,
    source   => "/tmp/${libs}",
    ensure   => installed,
  }

  file { $python3 :
    ensure   => file,
    path     => "/tmp/${python3}",
    source   => "${rpm_path}/${python3}",
  } ~>

  package { $python3 :
    provider => rpm,
    source   => "/tmp/${python3}",
    ensure   => installed,
    require  => Package[$libs],
  }

  file { $pip :
    ensure   => file,
    path     => "/tmp/${pip}",
    source   => "${rpm_path}/${pip}",
  } ~>

  package { $pip :
    provider => rpm,
    source   => "/tmp/${pip}",
    ensure   => installed,
    require  => Package[$setuptools],
  }

  file { $gunicorn :
    ensure   => file,
    path     => "/tmp/${gunicorn}",
    source   => "${rpm_path}/${gunicorn}",
  } ~>

  package { $gunicorn :
    provider => rpm,
    source   => "/tmp/${gunicorn}",
    ensure   => installed,
    require  => Package[$python3],
  }

}