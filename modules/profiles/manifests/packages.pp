class profiles::packages {
  include ::java
  include ::wget

 $PKGLIST = [
   'epel-release','nmap','gcc','gcc-c++','ruby','psmisc','vim-enhanced',
   'tree','python-devel','wget','python','autoconf','automake','autoconf',
   'ruby','rubygems','java-1.7.0-openjdk','java-1.7.0-openjdk-devel',
   'binutils','bison','flex','gettext','libtool','make','patch','pkgconfig',
   'redhat-rpm-config','rpm-build','rpm-sign','libxml2','libxslt',
   'libxml2-devel','psmisc','ruby-devel','finger','git','lsof']



 ensure_packages($PKGLIST)

  package {['bundler','rake']:
    ensure   => installed,
    provider => gem
  }

}