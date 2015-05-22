class profiles::ntp (

  $ntp_servers   = ['0.uk.pool.ntp.org', '1.uk.pool.ntp.org','2.uk.pool.ntp.org'],

) {

     class {'::ntp':
       servers  => $ntp_servers,
       package_ensure  => 'present',
       restrict => [
         'default kod nomodify notrap nopeer noquery',
         '-6 default kod nomodify notrap nopeer noquery',
         '127.0.0.1',
         '-6 ::1',
       ],
     }

}