# == class: exim::service
#
# This class manages the exim service
#
class exim::service {
  if $::exim::manage_service {
    service{$::exim::exim_service:
      ensure => running,
    }
  }
}
