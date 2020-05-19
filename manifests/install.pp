# == class: exim::install
#
# This class installes the exim package
#
class exim::install {
  if ($::exim::heavy) {
    $exim_package = $::exim::exim_heavy_package
  }
  else {
    $exim_package = $::exim::exim_light_package
  }
  package { $exim_package:
    ensure => installed,
  }
}
