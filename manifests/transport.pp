# == Define: exim::transport
#
# This module configures a single transport in exims configuration
#
# === Parameters
#
# [*allow_localhost*]
#   Allow connections to localhost
#
# [*driver*]
#   Type of transport.
#
# [*connect_timeout*]
#   Timeout when connecting to remote Servers.
#
# [*hosts*]
#   The hosts option specifies a list of hosts to be used if the address
#   being processed does not have any hosts associated with it. The hosts
#   specified by hosts are also used, whether or not the address has its
#   own hosts, if hosts_override is set.
#
# [*port*]
#   The port exim connects to on the remote server
#
# [*return_output*]
#   If this option is true, and the command produced any output, the delivery
#   is deemed to have failed whatever the return code from the command, and
#   the output is returned in the bounce message
#
define exim::transport (
  $driver,
  $allow_localhost      = false,
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
  $hosts                = undef,
  $initgroups           = false,
  $log_output           = false,
  $maildir_format       = false,
  $maildir_tag          = undef,
  $message_prefix       = undef,
  $message_suffix       = undef,
  $mode                 = undef,
  $port                 = undef,
  $socket               = undef,
  $subject              = undef,
  $return_output        = false,
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

  if ($temp_errors)      { validate_array($temp_errors) }
  if ($hosts)            { validate_array($hosts      ) }
  if ($batch_max)        { unless is_integer($batch_max) { fail("${batch_max} must be an integer") } }
  if ($port)             { unless is_integer($port)      { fail("${port} must be an integer") } }

  validate_bool($delivery_date_add,$envelope_to_add,$freeze_exec_fail,$initgroups,
                $log_output,$maildir_format,$return_path_add,$rcpt_include_affixes,
                $allow_localhost,$return_output)

  concat::fragment { "transport-${title}":
    target  => $::exim::config_path,
    content => template("${module_name}/transport/transport.erb"),
    order   => 3001,
  }
}
