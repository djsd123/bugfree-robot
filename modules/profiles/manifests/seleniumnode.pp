class profiles::seleniumnode {

  $hub     = hiera('hub')

  require java

  class { 'display':
    width  => 1680,
    height => 1050,
  } ->
  class { 'selenium::node':
    hub    => $hub,
  }
}