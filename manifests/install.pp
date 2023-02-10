# @api private
#
# @summary
#   This class installes the exim package
#
class exim::install (
  Boolean $use_epel
) inherits exim {
  if ($use_epel and $facts['os']['family'] == 'redhat') {
    include epel
  }
  if ($exim::heavy) {
    $exim_package = $exim::exim_heavy_package
  }
  else {
    $exim_package = $exim::exim_light_package
  }
  package { $exim_package:
    ensure => installed,
  }
  if ($facts['os']['family'] == 'redhat') {
    Class['Epel'] -> Package[$exim_package]
  }
}
