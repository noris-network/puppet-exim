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
  $command           = undef,
  $connect_timeout   = undef,
  $delivery_date_add = false,
  $directory_mode    = undef,
  $envelope_to_add   = false,
  $file              = undef,
  $freeze_exec_fail  = false,
  $group             = undef,
  $home_directory    = undef,
  $initgroups        = false,
  $log_output        = undef,
  $message_prefix    = undef,
  $message_suffix    = undef,
  $mode              = undef,
  $subject           = undef,
  $return_path_add   = false,
  $temp_errors       = undef,
  $text              = undef,
  $to                = undef,
  $transport_filter  = undef,
  $user              = undef,
  ){
  concat::fragment { "transport-${title}":
    target  => $::exim::config_path,
    content => template("${module_name}/transport/transport.erb"),
    order   => 3001,
  }
}
