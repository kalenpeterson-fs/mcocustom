# == Class: mcocustom::params
#
class mcocustom::params {

  case $::osfamily {
      'RedHat': {
        $mcoLibDir = '/opt/puppetlabs/mcollective/plugins'
      }
      'Debian': {
        $mcoLibDir = '/opt/puppetlabs/mcollective/plugins'
      }
      'windows': {
        $mcoLibDir = "${::env_windows_installdir}/mcollective/lib"
      }
      default: {
        fail("${::osfamily} is not supported")
      }
  }
}
