class profiles::python_tools2 {

  $rpm_path   =  "puppet:///modules/profiles/files"
  $gunicorn   =  "python3-gunicorn-18.0-1.fc20.noarch.rpm"
  $python3    =  "python3-3.3.2-19.fc20.x86_64.rpm"
  $pip        =  "python3-pip-1.4.1-1.fc20.noarch.rpm"
  $setuptools =  "python3-setuptools-1.4.2-1.fc20.noarch.rpm"
  $libs       =  "python3-libs-3.3.2-19.fc20.x86_64.rpm"

  package { $setuptools :
    provider => rpm,
    source   => "${rpm_path}/${setuptools}",
    ensure   => installed,
  }

  package { $libs :
    provider => rpm,
    source   => "${rpm_path}/${libs}",
    ensure   => installed,
  }

  package { $python3 :
    provider => rpm,
    source   => "${rpm_path}/${python3}",
    ensure   => installed,
    require  => Package['libs'],
  }

  package { $pip :
    provider => rpm,
    source   => "${rpm_path}/${pip}",
    ensure   => installed,
    require  => Package['setuptools'],
  }

  package { $gunicorn :
    provider => rpm,
    source   => "${rpm_path}/${gunicorn}",
    ensure   => installed,
    require  => Package['python3'],
  }

}