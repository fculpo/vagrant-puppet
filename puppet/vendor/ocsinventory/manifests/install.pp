# == Class ocsinventory::install
#
class ocsinventory::install {
  if $::ocsinventory::agent {
    package { $::ocsinventory::pkg_list_agent:
      ensure => $::ocsinventory::pkg_agent_ensure,
    }
  }

  if $::ocsinventory::server {
    package { $::ocsinventory::pkg_list_server:
      ensure => $::ocsinventory::pkg_server_ensure,
    }
  }
}

