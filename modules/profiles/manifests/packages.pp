class profiles::packages {
  include ::java
  include ::wget
# TODO move array into hiera
 $PKGLIST = [
   'epel-release','nmap','gcc','gcc-c++','ruby','psmisc','vim-enhanced',
   'tree','python-devel','wget','python','autoconf','automake','autoconf',
   'ruby','rubygems','java-1.7.0-openjdk','java-1.7.0-openjdk-devel',
   'binutils','bison','flex','gettext','libtool','make','patch','pkgconfig',
   'redhat-rpm-config','rpm-build','rpm-sign','libxml2','libxslt',
   'libxml2-devel','psmisc','ruby-devel','finger','git','lsof','openssl-libs',
   'pyOpenSSL.x86_64','bzip2-devel','bzip2-libs','readline','readline-static',
   'readline-devel','python-lxml','cairo','pango','gdk-pixbuf2','libffi-devel',
   'libxslt-devel','libxml2-devel','python-cairosvg','telnet','bind-utils']



 ensure_packages($PKGLIST)

  package {['bundler','rake']:
    ensure   => installed,
    provider => gem
  }

}