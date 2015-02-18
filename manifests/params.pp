# == class: exim::params
#
# This module sets all default parameters
#
class exim::params {
  case $::osfamily {
    'debian': {
      $exim_light_package = 'exim4'
      $exim_heavy_package = 'exim4-daemon-heavy'
      $exim_service = 'exim4'
      $config_path = '/etc/exim4/exim4.conf'
    }
    'redhat': {
      $exim_light_package = 'exim'
      $exim_heavy_package = 'exim'
      $exim_service = 'exim'
      $config_path = '/etc/exim/exim.conf'
    }
    default: {
      fail("The ${module_name} module is not supported on ${::osfamily} based systems")
    }
  }

  $acl_smtp_rcpt                    = 'acl_check_rcpt'
  $defaults                         = true
  $daemon_smtp_ports                = undef
  $heavy                            = false
  $log_smtp_confirmation            = true
  $log_smtp_connection              = true
  $log_smtp_protocol_error          = true
  $log_smtp_syntax_error            = true
  $log_sender_on_delivery           = true
  $log_lost_incoming_connection     = true
  $log_tls_peerdn                   = true
  $log_skip_delivery                = true
  $log_retry_defer                  = true
  $local_interfaces                 = undef
  $message_logs                     = true
  $log_file_path                    = undef
  $syslog_timestamp                 = true
  $av_scanner                       = undef
  $spamd_address                    = undef
  $system_filter                    = undef
  $split_spool_directory            = false
  $check_spool_space                = undef
  $helo_allow_chars                 = undef
  $allow_mx_to_ip                   = false
  $never_users                      = 'root'
  $rfc1413_hosts                    = '*'
  $rfc1413_query_timeout            = '5s'
  $ignore_bounce_errors_after       = '2d'
  $message_size_limit               = undef
  $host_lookup                      = '*'
  $errors_reply_to                  = undef
  $auto_thaw                        = undef
  $smtp_banner                      = undef
  $timeout_frozen_after             = '7d'
  $trusted_users                    = undef
  $qualify_domain                   = undef
  $tls_certificate                  = undef
  $tls_privatekey                   = undef
  $gnutls_compat_mode               = false
  $delay_warning                    = undef
  $smtp_accept_max_nonmail          = undef
  $smtp_accept_max                  = undef
  $smtp_accept_max_per_connection   = undef
  $smtp_accept_max_per_host         = undef
  $smtp_accept_queue                = undef
  $smtp_accept_queue_per_connection = undef
  $smtp_accept_reserve              = undef
  $smtp_reserve_hosts               = undef
  $deliver_queue_load_max           = undef
  $queue_only_load                  = undef
  $queue_only                       = false
  $remote_max_parallel              = undef
  $queue_run_max                    = undef
  $callout_domain_positive_expire   = undef
  $hosts_treat_as_local             = undef
}
