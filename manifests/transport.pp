# == Define: exim::transport
#
# This module configures a single transport in exims configuration
#
# === Parameters
#
# [*driver*]
#   Type of transport.
#
# [*connect_timeout*]
#   Timeout when connecting to remote Servers.
#
define exim::transport (
  $driver,
  $connect_timeout=undef,
  ){
  concat::fragment { "transport-${title}":
    target  => $::exim::config_path,
    content => template("${module_name}/transport/transport.erb"),
    order   => 3001,
  }
}
