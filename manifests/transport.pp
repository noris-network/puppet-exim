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
  if ($directory)        { validate_string($directory) }
  if ($command)          { validate_string($command) }
  if ($connect_timeout)  { validate_string($connect_timeout) }
  if ($directory_mode)   { validate_string($directory_mode) }
  if ($file)             { validate_string($file) }
  if ($group)            { validate_string($group) }
  if ($home_directory)   { validate_string($home_directory) }
  if ($maildir_tag)      { validate_string($maildir_tag) }
  if ($message_prefix)   { validate_string($message_prefix) }
  if ($message_suffix)   { validate_string($message_suffix) }
  if ($mode)             { validate_string($mode) }
  if ($socket)           { validate_string($socket) }
  if ($subject)          { validate_string($subject) }
  if ($text)             { validate_string($text) }
  if ($to)               { validate_string($to) }
  if ($transport_filter) { validate_string($transport_filter) }
  if ($user)             { validate_string($user) }
  if ($temp_errors)      { validate_array($temp_errors) }
  if ($batch_max)        { validate_integer($batch_max) }
  validate_bool($delivery_date_add,$envelope_to_add,$freeze_exec_fail,$initgroups,$log_output,$maildir_format,$return_path_add,$rcpt_include_affixes)

  concat::fragment { "transport-${title}":
    target  => $::exim::config_path,
    content => template("${module_name}/transport/transport.erb"),
    order   => 3001,
  }
}
