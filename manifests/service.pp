# @api private
#
# @summary
#   This class manages the exim service
#
class exim::service inherits exim {
  if $::exim::manage_service {
    service{$::exim::exim_service:
      ensure => running,
    }
  }
}
