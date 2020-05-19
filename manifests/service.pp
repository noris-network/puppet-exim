# == class: exim::service
#
# This class manages the exim service
#
class exim::service {
  if $::exim::manage_service {
    service{$::exim::params::exim_service:
      ensure => running,
    }
  }
}
