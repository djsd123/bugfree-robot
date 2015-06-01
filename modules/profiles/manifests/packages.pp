class profiles::packages {
  include ::java
  include ::wget

 $packages = [
   'epel-release','nmap','gcc','gcc-c++','ruby','psmisc','vim',
   'tree'
 ]

 ensure_packages($packages)

}