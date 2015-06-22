class profiles::packages {
  include ::java
  include ::wget

 $PKGLIST = [
   'epel-release','nmap','gcc','gcc-c++','ruby','psmisc','vim-enhanced',
   'tree','python-devel','wget','python','autoconf','automake','autoconf',
   'ruby','rubygems','java-1.7.0-openjdk','java-1.7.0-openjdk-devel',
   'binutils','bison','flex','gettext','libtool','make','patch','pkgconfig',
   'redhat-rpm-config','rpm-build','rpm-sign','libxml2','libxslt',
   'libxml2-devel','psmisc']
 $PYTHON   = 'lr-python3-3.4.3-1.x86_64'
 $PYPGK    = "${PYTHON}.rpm"
 $PKGMAN   = 'rpm'


 ensure_packages($PKGLIST)

  package {
    'python-pip':
      ensure      => installed,
      provider    => yum,
      require     => Package[$PKGLIST];
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

}