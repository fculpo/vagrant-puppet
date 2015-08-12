# == Class ocsinventory::config
#
class ocsinventory::config (
  $agent_ocs_mode   = $::ocsinventory::agent_ocs_mode,
  $agent_ocs_pause  = $::ocsinventory::agent_ocs_pause,
  $agent_ocs_server = $::ocsinventory::agent_ocs_server,
  $agent_ocs_tag    = $::ocsinventory::agent_ocs_tag,
)
{
  File {
    group   => $::ocsinventory::config_group,
    mode    => $::ocsinventory::config_file_mode,
    owner   => $::ocsinventory::config_user,
    require => Class['::ocsinventory::install'],
  }

  file { $::ocsinventory::config_dir:
    ensure  => directory,
    mode    => $::ocsinventory::config_dir_mode,
    purge   => $::ocsinventory::config_purge,
    recurse => $::ocsinventory::config_dir_recurse;
  }

  if $::ocsinventory::agent {
    file {
      "${::ocsinventory::config_dir}/ocsinventory-agent.cfg":
        ensure => present;

      $::ocsinventory::log_dir_agent:
        ensure => directory;
    }

    if $::osfamily == 'RedHat' {
      file { '/etc/sysconfig/ocsinventory-agent':
        ensure  => present,
        content => template('ocsinventory/agent.sysconfig.erb');
      }
    }

    if $::osfamily == 'Debian' {
      file { '/etc/default/ocsinventory-agent':
        ensure  => present,
        content => template('ocsinventory/agent.default.erb');
      }
    }
  }

  if $::ocsinventory::server {
    file {
      "${::ocsinventory::config_dir}/ocsinventory-server":
        ensure  => directory,
        mode    => $::ocsinventory::config_dir_mode,
        purge   => $::ocsinventory::config_purge,
        recurse => $::ocsinventory::config_dir_recurse;

      "${::ocsinventory::config_dir_server}/plugins":
        ensure  => directory,
        mode    => $::ocsinventory::config_dir_mode,
        purge   => $::ocsinventory::config_purge,
        recurse => $::ocsinventory::config_dir_recurse;

      "${::ocsinventory::config_dir}/ocsinventory-server/htpasswd":
        ensure => present;

      $::ocsinventory::log_dir_server:
        ensure => directory;

      "${::ocsinventory::config_dir}/apache2-reports.conf.example":
        ensure  => present,
        content => template("ocsinventory/reports.${::osfamily}.conf.erb");

      "${::ocsinventory::config_dir}/apache2-server.conf.example":
        ensure  => present,
        content => template("ocsinventory/server.${::osfamily}.conf.erb");
    }
  }
}

