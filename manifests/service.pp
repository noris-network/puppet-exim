# == class: exim::service
#
# This class manages the exim service
#
class exim::service inherits exim {
  if $manage_service {
    ::service{$exim_service:
      ensure => running,
    }
  }
}
