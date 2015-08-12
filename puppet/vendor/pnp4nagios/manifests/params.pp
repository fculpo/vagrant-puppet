
class pnp4nagios::params (
  $ensure = present,
  $monitoring_type = hiera('monitoring::params::monitoring_type'),
  $log_type = 'file',
  $debug_lvl = 0,
) {
  # check log_type
  validate_re($log_type, '^(syslog|file)$',
  "${log_type} is not supported for log_type.
  Allowed values are 'syslog' and 'file'.")
  # check monitoring_type
  validate_re($monitoring_type, '^(icinga|nagios)$',
  "${monitoring_type} is not supported for monitoring_type.
  Allowed values are 'icinga' and 'nagios'.")
}
