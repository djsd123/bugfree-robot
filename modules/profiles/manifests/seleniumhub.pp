class profiles::seleniumhub {

  require java

  class { 'selenium::hub': }

}