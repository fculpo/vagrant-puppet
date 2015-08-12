class pnp4nagios::install {
  #  include pnp4nagios::params
  $ensure = $pnp4nagios::params::ensure

  package { 'pnp4nagios':
    ensure => $ensure,
  }
  if $monitoring_type == 'icinga' {
    package { 'icinga-web-module-pnp':
      ensure => $ensure,
    }
  }
}
