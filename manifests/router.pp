# == Define: exim::router
#
# This module configures a single router in exims configuration
#
# === Parameters
#
# [*order*]
#  Order of routers is important, set it here
#
# [*driver*]
#  Sets the type of router.
#
# [*allow_defer*]
#  If set to true, the router can defer messages if needed.
#
# [*allow_fail*]
#  If set to true, the router can fail messages if needed.
#
# [*condition*]
#  (Advanced) Conditions when this router should be used
#
# [*data*]
#  Data source for the rewrite router
#
# [*debug_print*]
#  Used to print debug information
#
# [*domains*]
#  Domains for which this router should be used.
#
# [*host_find_failed*]
#  Relevant to the manualroute router, it determines what shoud
#  happen if the used host can't be resolved to an IP address.
#
# [*no_address_test*]
#  Skip this router in address testing mode (exim -bt)
#
# [*no_more*]
#  If conditions are met for this router, but the router can't process
#  this mail, the address fails instead of handeld down to the next router.
#
# [*no_verify*]
#  Skip this router when verifying addresses.
#
# [*route_list*]
#  Target server used by manualroute router.
#
# [*same_domain_copy_routing*]
#  This option copys routing information to all mails targeting the same domain.
#
# [*transport*]
#  Which transport should be used to send mails.
#
define exim::router (
  $order,
  $driver,
  $allow_defer              = false,
  $allow_fail               = false,
  $condition                = undef,
  $data                     = undef,
  $domains                  = undef,
  $host_find_failed         = undef,
  $no_address_test          = false,
  $no_more                  = false,
  $no_verify                = false,
  $route_list               = undef,
  $same_domain_copy_routing = undef,
  $transport                = undef,
  $debug_print              = undef,
  ){
  concat::fragment { "router-${title}":
    target  => $::exim::config_path,
    content => template("${module_name}/router/router.erb"),
    order   => $order + 2000,
  }
}
