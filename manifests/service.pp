# == class: exim::service
#
# This class manages the exim service
#
class exim::service {
  notice("service: ${::exim::manage_service}")
  if $::exim::manage_service {
    service{$::exim::params::exim_service:
      ensure => running,
    }
  }
}
