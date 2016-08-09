# == Class: mcocustom::install
#
class mcocustom::install {
  $mcoLibDir = $::mcocustom::params::mcoLibDir

  # Manage the Deploy MCO Agent ruby file
  file { 'agent_deploy.rb':
    ensure => present,
    path   => "${mcoLibDir}/mcollective/agent/deploy.rb",
    source => 'puppet:///modules/mcocustom/mcollective/agent/deploy.rb',
    notify => Service['mcollective'],
  }

  # Manage the Deploy MCO Agent ddl file
  file { 'agent_deploy.ddl':
    ensure => present,
    path   => "${mcoLibDir}/mcollective/agent/deploy.ddl",
    source => 'puppet:///modules/mcocustom/mcollective/agent/deploy.ddl',
    notify => Service['mcollective'],
  }

  # Manage the Deploy MCO Application
  file { 'application_deploy.rb':
    ensure => present,
    path   => "${mcoLibDir}/mcollective/application/deploy.rb",
    source => 'puppet:///modules/mcocustom/mcollective/application/deploy.rb',
    notify => Service['mcollective'],
  }
}
