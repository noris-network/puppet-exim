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
  $batch_max            = undef,
  $directory            = undef,
  $command              = undef,
  $connect_timeout      = undef,
  $delivery_date_add    = false,
  $directory_mode       = undef,
  $envelope_to_add      = false,
  $file                 = undef,
  $freeze_exec_fail     = false,
  $group                = undef,
  $home_directory       = undef,
  $initgroups           = false,
  $log_output           = false,
  $maildir_format       = false,
  $maildir_tag          = undef,
  $message_prefix       = undef,
  $message_suffix       = undef,
  $mode                 = undef,
  $socket               = undef,
  $subject              = undef,
  $return_path_add      = false,
  $temp_errors          = undef,
  $text                 = undef,
  $to                   = undef,
  $transport_filter     = undef,
  $user                 = undef,
  $rcpt_include_affixes = false,
  ){
  if ($directory)        { validate_re($directory       ,'^.+$') }
  if ($command)          { validate_re($command         ,'^.+$') }
  if ($connect_timeout)  { validate_re($connect_timeout ,'^.+$') }
  if ($directory_mode)   { validate_re($directory_mode  ,'^.+$') }
  if ($file)             { validate_re($file            ,'^.+$') }
  if ($group)            { validate_re($group           ,'^.+$') }
  if ($home_directory)   { validate_re($home_directory  ,'^.+$') }
  if ($maildir_tag)      { validate_re($maildir_tag     ,'^.+$') }
  if ($message_prefix)   { validate_re($message_prefix  ,'^.+$') }
  if ($message_suffix)   { validate_re($message_suffix  ,'^.+$') }
  if ($mode)             { validate_re($mode            ,'^.+$') }
  if ($socket)           { validate_re($socket          ,'^.+$') }
  if ($subject)          { validate_re($subject         ,'^.+$') }
  if ($text)             { validate_re($text            ,'^.+$') }
  if ($to)               { validate_re($to              ,'^.+$') }
  if ($transport_filter) { validate_re($transport_filter,'^.+$') }
  if ($user)             { validate_re($user            ,'^.+$') }
  if ($temp_errors)      { validate_array($temp_errors  ,) }
  if ($batch_max)        { validate_re("${batch_max}",'^[0-9]+$') }
  validate_bool($delivery_date_add,$envelope_to_add,$freeze_exec_fail,$initgroups,$log_output,$maildir_format,$return_path_add,$rcpt_include_affixes)

  concat::fragment { "transport-${title}":
    target  => $::exim::config_path,
    content => template("${module_name}/transport/transport.erb"),
    order   => 3001,
  }
}
