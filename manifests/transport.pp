# == Define: exim::transport
#
# This module configures a single transport in exims configuration
#
# === Parameters
#
# [*allow_localhost*]
#   Allow connections to localhost
#
# [*comment*]
#   Comment a router, this will be placed as a comment just above
#   the router.
#
# [*driver*]
#   Type of transport.
#
# [*connect_timeout*]
#   Timeout when connecting to remote Servers.
#
# [*connection_max_messages*]
#   Set the maximum number of messages that can be transfered in a single connection.
#
# [*exim_environment*]
#   This option is used to add additional variables to the environment in which the command runs.
#
# [*fallback_hosts*]
#   If Exim is unable to deliver to any of the hosts for a particular address, and the
#   errors are not permanent rejections, the address is put on a separate transport
#   queue with its host list replaced by the fallback hosts.
#
# [*helo_data*]
#  sets the helo name exim uses when connecting to a remote server.
#
# [*headers_remove*]
#  list of headers to remove.
#
# [*headers_add*]
#  list of headers to add.
#
# [*hosts*]
#   The hosts option specifies a list of hosts to be used if the address
#   being processed does not have any hosts associated with it. The hosts
#   specified by hosts are also used, whether or not the address has its
#   own hosts, if hosts_override is set.
#
# [*hosts_require_auth*]
#   Specifies a list of servers for which authentication must succeed before Exim will try
#   to transfer a message. If authentication fails for one of these servers, delivery is deferred.
#
# [*hosts_require_tls*]
#   List of hosts requiring tls, messages are only sent if tls can be established.
#
# [*hosts_try_auth*]
#   The host_try_auth option provides a list of hosts to which, provided they announce
#   authentication support, Exim will attempt to authenticate as a client when it connects.
#
# [*path*]
#   This option specifies the string that is set up in the
#   PATH environment variable of the subprocess.
#
# [*port*]
#   The port exim connects to on the remote server
#
# [*return_fail_output*]
#   If set to true, the command output is returned in the bounce message in case of failure.
#
# [*return_output*]
#   If this option is true, and the command produced any output, the delivery
#   is deemed to have failed whatever the return code from the command, and
#   the output is returned in the bounce message
#
# [*timeout*]
#   If the command fails to complete within this time, it is killed.
#
# [*timeout_defer*]
#   Set this to true for timeouts to become temporary errors, causing the delivery to be deferred.
#
# [*tls_dh_min_bits*]
#   set the minimum acceptable number of bits in the Diffie-Hellman prime offered by a server,
#   default is 1024
#
# [*tls_verify_certificates*]
#   Give a path to certificates agains which connections are verified.
#
# [*interface*]
#   sets the outgoing ip for smtp transports.
#
define exim::transport (
  $driver,
  $allow_localhost         = false,
  $batch_max               = undef,
  $command                 = undef,
  $comment                 = undef,
  $connection_max_messages = undef,
  $connect_timeout         = undef,
  $delivery_date_add       = false,
  $directory_mode          = undef,
  $directory               = undef,
  $envelope_to_add         = false,
  $fallback_hosts          = undef,
  $file                    = undef,
  $freeze_exec_fail        = false,
  $group                   = undef,
  $headers_add             = undef,
  $headers_remove          = undef,
  $helo_data               = undef,
  $home_directory          = undef,
  $hosts_require_auth      = undef,
  $hosts_require_tls       = undef,
  $hosts_try_auth          = undef,
  $exim_environment        = undef,
  $hosts                   = undef,
  $initgroups              = false,
  $interface               = undef,
  $log_output              = false,
  $maildir_format          = false,
  $maildir_tag             = undef,
  $message_prefix          = undef,
  $message_suffix          = undef,
  $mode                    = undef,
  $path                    = undef,
  $port                    = undef,
  $rcpt_include_affixes    = false,
  $return_fail_output      = false,
  $return_output           = false,
  $return_path_add         = false,
  $socket                  = undef,
  $subject                 = undef,
  $temp_errors             = undef,
  $timeout                 = undef,
  $timeout_defer           = false,
  $text                    = undef,
  $tls_dh_min_bits         = undef,
  $tls_verify_certificates = undef,
  $to                      = undef,
  $transport_filter        = undef,
  $user                    = undef,
  ){
  if ($directory)               { validate_re($directory              ,'^.+$') }
  if ($command)                 { validate_re($command                ,'^.+$') }
  if ($connect_timeout)         { validate_re($connect_timeout        ,'^.+$') }
  if ($directory_mode)          { validate_re($directory_mode         ,'^.+$') }
  if ($file)                    { validate_re($file                   ,'^.+$') }
  if ($group)                   { validate_re($group                  ,'^.+$') }
  if ($home_directory)          { validate_re($home_directory         ,'^.+$') }
  if ($maildir_tag)             { validate_re($maildir_tag            ,'^.+$') }
  if ($message_prefix)          { validate_re($message_prefix         ,'^.+$') }
  if ($message_suffix)          { validate_re($message_suffix         ,'^.+$') }
  if ($mode)                    { validate_re($mode                   ,'^.+$') }
  if ($path)                    { validate_re($path                   ,'^.+$') }
  if ($socket)                  { validate_re($socket                 ,'^.+$') }
  if ($subject)                 { validate_re($subject                ,'^.+$') }
  if ($text)                    { validate_re($text                   ,'^.+$') }
  if ($to)                      { validate_re($to                     ,'^.+$') }
  if ($transport_filter)        { validate_re($transport_filter       ,'^.+$') }
  if ($timeout)                 { validate_re($timeout                ,'^.+$') }
  if ($tls_verify_certificates) { validate_re($tls_verify_certificates,'^.+$') }
  if ($user)                    { validate_re($user                   ,'^.+$') }
  if ($interface)               { validate_re($interface              ,'^.+$') }
  if ($helo_data)               { validate_re($helo_data              ,'^.+$') }

  if ($temp_errors)       { validate_array($temp_errors       ) }
  if ($hosts)             { validate_array($hosts             ) }
  if ($headers_remove)    { validate_array($headers_remove    ) }
  if ($headers_add)       { validate_array($headers_add       ) }
  if ($fallback_hosts)    { validate_array($fallback_hosts    ) }
  if ($exim_environment)  { validate_array($exim_environment  ) }
  if ($hosts_require_auth){ validate_array($hosts_require_auth) }
  if ($hosts_require_tls) { validate_array($hosts_require_tls ) }
  if ($hosts_try_auth)    { validate_array($hosts_try_auth    ) }

  if ($batch_max)               { validate_re("x${batch_max}"               ,'^x[0-9]+$') }
  if ($port)                    { validate_re("x${port}"                    ,'^x[0-9]+$') }
  if ($connection_max_messages) { validate_re("x${connection_max_messages}" ,'^x[0-9]+$') }
  if ($tls_dh_min_bits)         { validate_re("x${tls_dh_min_bits}"         ,'^x[0-9]+$') }

  validate_bool($delivery_date_add,$envelope_to_add,$freeze_exec_fail,$initgroups,
                $log_output,$maildir_format,$return_path_add,$rcpt_include_affixes,
                $allow_localhost,$return_output,$return_fail_output,$timeout_defer)

  concat::fragment { "transport-${title}":
    target  => $::exim::config_path,
    content => template("${module_name}/transport/transport.erb"),
    order   => 3001,
  }
}
