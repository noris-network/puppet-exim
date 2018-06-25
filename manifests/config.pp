# == Class: exim::config
#
# This class creates exims main config file
#

class exim::config {

  $acl_not_smtp                       =$::exim::acl_not_smtp
  $acl_smtp_auth                      =$::exim::acl_smtp_auth
  $acl_smtp_data                      =$::exim::acl_smtp_data
  $acl_smtp_mail                      =$::exim::acl_smtp_mail
  $acl_smtp_mime                      =$::exim::acl_smtp_mime
  $acl_smtp_rcpt                      =$::exim::acl_smtp_rcpt
  $allow_mx_to_ip                     =$::exim::allow_mx_to_ip
  $auto_thaw                          =$::exim::auto_thaw
  $av_scanner                         =$::exim::av_scanner
  $callout_domain_positive_expire     =$::exim::callout_domain_positive_expire
  $check_spool_space                  =$::exim::check_spool_space
  $chunking_advertise_hosts           =$::exim::chunking_advertise_hosts
  $config_path                        =$::exim::config_path
  $daemon_smtp_ports                  =$::exim::daemon_smtp_ports
  $defaults                           =$::exim::defaults
  $delay_warning                      =$::exim::delay_warning
  $deliver_queue_load_max             =$::exim::deliver_queue_load_max
  $errors_reply_to                    =$::exim::errors_reply_to
  $extract_addresses_remove_arguments =$::exim::extract_addresses_remove_arguments
  $freeze_tell                        =$::exim::freeze_tell
  $gnutls_compat_mode                 =$::exim::gnutls_compat_mode
  $heavy                              =$::exim::heavy
  $helo_allow_chars                   =$::exim::helo_allow_chars
  $host_lookup                        =$::exim::host_lookup
  $hosts_treat_as_local               =$::exim::hosts_treat_as_local
  $ignore_bounce_errors_after         =$::exim::ignore_bounce_errors_after
  $includes                           =$::exim::includes
  $ldap_default_servers               =$::exim::ldap_default_servers
  $local_from_check                   =$::exim::local_from_check
  $local_interfaces                   =$::exim::local_interfaces
  $log_file_path                      =$::exim::log_file_path
  $macros                             =$::exim::macros
  $manage_service                     =$::exim::manage_service
  $message_logs                       =$::exim::message_logs
  $message_size_limit                 =$::exim::message_size_limit
  $never_users                        =$::exim::never_users
  $untrusted_set_sender               =$::exim::untrusted_set_sender 
  $print_topbitchars                  =$::exim::print_topbitchars
  $qualify_domain                     =$::exim::qualify_domain
  $queue_only_load                    =$::exim::queue_only_load
  $queue_run_max                      =$::exim::queue_run_max
  $remote_max_parallel                =$::exim::remote_max_parallel
  $rfc1413_hosts                      =$::exim::rfc1413_hosts
  $rfc1413_query_timeout              =$::exim::rfc1413_query_timeout
  $smtp_accept_max                    =$::exim::smtp_accept_max
  $smtp_accept_max_nonmail            =$::exim::smtp_accept_max_nonmail
  $smtp_accept_max_per_connection     =$::exim::smtp_accept_max_per_connection
  $smtp_accept_max_per_host           =$::exim::smtp_accept_max_per_host
  $smtp_accept_queue                  =$::exim::smtp_accept_queue
  $smtp_accept_queue_per_connection   =$::exim::smtp_accept_queue_per_connection
  $smtp_accept_reserve                =$::exim::smtp_accept_reserve
  $smtp_banner                        =$::exim::smtp_banner
  $smtp_reserve_hosts                 =$::exim::smtp_reserve_hosts
  $spamd_address                      =$::exim::spamd_address
  $split_spool_directory              =$::exim::split_spool_directory
  $syslog_timestamp                   =$::exim::syslog_timestamp
  $system_filter                      =$::exim::system_filter
  $timeout_frozen_after               =$::exim::timeout_frozen_after
  $tls_advertise_hosts                =$::exim::tls_advertise_hosts
  $tls_certificate                    =$::exim::tls_certificate
  $tls_privatekey                     =$::exim::tls_privatekey
  $trusted_users                      =$::exim::trusted_users

  if is_bool($::exim::log_lost_incoming_connection) { $log_lost_incoming_connection = bool2str($::exim::log_lost_incoming_connection) } else { $log_lost_incoming_connection = $::exim::log_lost_incoming_connection }
  if is_bool($::exim::log_retry_defer) { $log_retry_defer = bool2str($::exim::log_retry_defer) } else { $log_retry_defer = $::exim::log_retry_defer }
  if is_bool($::exim::log_sender_on_delivery) { $log_sender_on_delivery = bool2str($::exim::log_sender_on_delivery) } else { $log_sender_on_delivery = $::exim::log_sender_on_delivery }
  if is_bool($::exim::log_skip_delivery) { $log_skip_delivery = bool2str($::exim::log_skip_delivery) } else { $log_skip_delivery = $::exim::log_skip_delivery }
  if is_bool($::exim::log_smtp_confirmation) { $log_smtp_confirmation = bool2str($::exim::log_smtp_confirmation) } else { $log_smtp_confirmation = $::exim::log_smtp_confirmation }
  if is_bool($::exim::log_smtp_connection) { $log_smtp_connection = bool2str($::exim::log_smtp_connection) } else { $log_smtp_connection = $::exim::log_smtp_connection }
  if is_bool($::exim::log_smtp_protocol_error) { $log_smtp_protocol_error = bool2str($::exim::log_smtp_protocol_error) } else { $log_smtp_protocol_error = $::exim::log_smtp_protocol_error }
  if is_bool($::exim::log_smtp_syntax_error) { $log_smtp_syntax_error = bool2str($::exim::log_smtp_syntax_error) } else { $log_smtp_syntax_error = $::exim::log_smtp_syntax_error }
  if is_bool($::exim::log_tls_peerdn) { $log_tls_peerdn = bool2str($::exim::log_tls_peerdn) } else { $log_tls_peerdn = $::exim::log_tls_peerdn }
  if is_bool($::exim::log_mail_subject) { $log_mail_subject = bool2str($::exim::log_mail_subject) } else { $log_mail_subject = $::exim::log_mail_subject }
  if is_bool($::exim::log_8bitmime) { $log_8bitmime = bool2str($::exim::log_8bitmime) } else { $log_8bitmime = $::exim::log_8bitmime }
  if is_bool($::exim::log_acl_warn_skipped) { $log_acl_warn_skipped = bool2str($::exim::log_acl_warn_skipped) } else { $log_acl_warn_skipped = $::exim::log_acl_warn_skipped }
  if is_bool($::exim::log_address_rewrite) { $log_address_rewrite = bool2str($::exim::log_address_rewrite) } else { $log_address_rewrite = $::exim::log_address_rewrite }
  if is_bool($::exim::log_all_parents) { $log_all_parents = bool2str($::exim::log_all_parents) } else { $log_all_parents = $::exim::log_all_parents }
  if is_bool($::exim::log_arguments) { $log_arguments = bool2str($::exim::log_arguments) } else { $log_arguments = $::exim::log_arguments }
  if is_bool($::exim::log_connection_reject) { $log_connection_reject = bool2str($::exim::log_connection_reject) } else { $log_connection_reject = $::exim::log_connection_reject }
  if is_bool($::exim::log_delay_delivery) { $log_delay_delivery = bool2str($::exim::log_delay_delivery) } else { $log_delay_delivery = $::exim::log_delay_delivery }
  if is_bool($::exim::log_deliver_time) { $log_deliver_time = bool2str($::exim::log_deliver_time) } else { $log_deliver_time = $::exim::log_deliver_time }
  if is_bool($::exim::log_delivery_size) { $log_delivery_size = bool2str($::exim::log_delivery_size) } else { $log_delivery_size = $::exim::log_delivery_size }
  if is_bool($::exim::log_dnslist_defer) { $log_dnslist_defer = bool2str($::exim::log_dnslist_defer) } else { $log_dnslist_defer = $::exim::log_dnslist_defer }
  if is_bool($::exim::log_dnssec) { $log_dnssec = bool2str($::exim::log_dnssec) } else { $log_dnssec = $::exim::log_dnssec }
  if is_bool($::exim::log_etrn) { $log_etrn = bool2str($::exim::log_etrn) } else { $log_etrn = $::exim::log_etrn }
  if is_bool($::exim::log_host_lookup_failed) { $log_host_lookup_failed = bool2str($::exim::log_host_lookup_failed) } else { $log_host_lookup_failed = $::exim::log_host_lookup_failed }
  if is_bool($::exim::log_ident_timeout) { $log_ident_timeout = bool2str($::exim::log_ident_timeout) } else { $log_ident_timeout = $::exim::log_ident_timeout }
  if is_bool($::exim::log_incoming_interface) { $log_incoming_interface = bool2str($::exim::log_incoming_interface) } else { $log_incoming_interface = $::exim::log_incoming_interface }
  if is_bool($::exim::log_incoming_port) { $log_incoming_port = bool2str($::exim::log_incoming_port) } else { $log_incoming_port = $::exim::log_incoming_port }
  if is_bool($::exim::log_millisec) { $log_millisec = bool2str($::exim::log_millisec) } else { $log_millisec = $::exim::log_millisec }
  if is_bool($::exim::log_outgoing_interface) { $log_outgoing_interface = bool2str($::exim::log_outgoing_interface) } else { $log_outgoing_interface = $::exim::log_outgoing_interface }
  if is_bool($::exim::log_outgoing_port) { $log_outgoing_port = bool2str($::exim::log_outgoing_port) } else { $log_outgoing_port = $::exim::log_outgoing_port }
  if is_bool($::exim::log_queue_run) { $log_queue_run = bool2str($::exim::log_queue_run) } else { $log_queue_run = $::exim::log_queue_run }
  if is_bool($::exim::log_queue_time) { $log_queue_time = bool2str($::exim::log_queue_time) } else { $log_queue_time = $::exim::log_queue_time }
  if is_bool($::exim::log_queue_time_overall) { $log_queue_time_overall = bool2str($::exim::log_queue_time_overall) } else { $log_queue_time_overall = $::exim::log_queue_time_overall }
  if is_bool($::exim::log_pid) { $log_pid = bool2str($::exim::log_pid) } else { $log_pid = $::exim::log_pid }
  if is_bool($::exim::log_proxy) { $log_proxy = bool2str($::exim::log_proxy) } else { $log_proxy = $::exim::log_proxy }
  if is_bool($::exim::log_received_recipients) { $log_received_recipients = bool2str($::exim::log_received_recipients) } else { $log_received_recipients = $::exim::log_received_recipients }
  if is_bool($::exim::log_received_sender) { $log_received_sender = bool2str($::exim::log_received_sender) } else { $log_received_sender = $::exim::log_received_sender }
  if is_bool($::exim::log_rejected_header) { $log_rejected_header = bool2str($::exim::log_rejected_header) } else { $log_rejected_header = $::exim::log_rejected_header }
  if is_bool($::exim::log_return_path_on_delivery) { $log_return_path_on_delivery = bool2str($::exim::log_return_path_on_delivery) } else { $log_return_path_on_delivery = $::exim::log_return_path_on_delivery }
  if is_bool($::exim::log_sender_verify_fail) { $log_sender_verify_fail = bool2str($::exim::log_sender_verify_fail) } else { $log_sender_verify_fail = $::exim::log_sender_verify_fail }
  if is_bool($::exim::log_size_reject) { $log_size_reject = bool2str($::exim::log_size_reject) } else { $log_size_reject = $::exim::log_size_reject }
  if is_bool($::exim::log_smtp_incomplete_transaction) { $log_smtp_incomplete_transaction = bool2str($::exim::log_smtp_incomplete_transaction) } else { $log_smtp_incomplete_transaction = $::exim::log_smtp_incomplete_transaction }
  if is_bool($::exim::log_smtp_mailauth) { $log_smtp_mailauth = bool2str($::exim::log_smtp_mailauth) } else { $log_smtp_mailauth = $::exim::log_smtp_mailauth }
  if is_bool($::exim::log_smtp_no_mail) { $log_smtp_no_mail = bool2str($::exim::log_smtp_no_mail) } else { $log_smtp_no_mail = $::exim::log_smtp_no_mail }
  if is_bool($::exim::log_timezone) { $log_timezone = bool2str($::exim::log_timezone) } else { $log_timezone = $::exim::log_timezone }
  if is_bool($::exim::log_tls_certificate_verified) { $log_tls_certificate_verified = bool2str($::exim::log_tls_certificate_verified) } else { $log_tls_certificate_verified = $::exim::log_tls_certificate_verified }
  if is_bool($::exim::log_tls_cipher) { $log_tls_cipher = bool2str($::exim::log_tls_cipher) } else { $log_tls_cipher = $::exim::log_tls_cipher }
  if is_bool($::exim::log_tls_sni) { $log_tls_sni = bool2str($::exim::log_tls_sni) } else { $log_tls_sni = $::exim::log_tls_sni }
  if is_bool($::exim::log_unknown_in_list) { $log_unknown_in_list = bool2str($::exim::log_unknown_in_list) } else { $log_unknown_in_list = $::exim::log_unknown_in_list }

  concat { $::exim::config_path:
  }
  concat::fragment { 'main':
    target  => $::exim::config_path,
    content => template("${module_name}/base.erb"),
    order   => '0001',
  }
  concat::fragment { 'acl-header':
    target  => $::exim::config_path,
    content => template("${module_name}/acl/acl-header.erb"),
    order   => '1000',
  }
  concat::fragment { 'router-header':
    target  => $::exim::config_path,
    content => template("${module_name}/router/router-header.erb"),
    order   => '2000',
  }
  concat::fragment { 'transport-header':
    target  => $::exim::config_path,
    content => template("${module_name}/transport/transport-header.erb"),
    order   => '3000',
  }
  concat::fragment { 'retry-header':
    target  => $::exim::config_path,
    content => template("${module_name}/retry/retry-header.erb"),
    order   => '4000',
  }
  concat::fragment { 'authenticator-header':
    target  => $::exim::config_path,
    content => template("${module_name}/authenticator/authenticator-header.erb"),
    order   => '5000',
  }

  if $::exim::defaults {
    exim::acl {'acl_check_rcpt':
      statements => {
        'Accept local'    => {
          acl_id     => 1,
          order      => 1,
          action     => 'accept',
          conditions => [ ['hosts',[':']] ],
        },
        'Accept hostlist' => {
          acl_id     => 1,
          order      => 2,
          action     => 'accept',
          conditions => [ ['hosts'   , ['127.0.0.1','@']], ]
        },
        'deny all'        => {
          acl_id     => 1,
          order      => 3,
          action     => 'deny',
          conditions => [ ['message' , ['relay not permitted']], ]
        },
      }
    }

    exim::router {'system_aliases':
      order       => 1,
      driver      => 'redirect',
      domains     => ['@'],
      allow_fail  => true,
      allow_defer => true,
      data        => '${lookup{$local_part}lsearch{/etc/aliases}}',
    }
    exim::router {'smarthost':
      order                    => 2,
      driver                   => 'manualroute',
      transport                => 'remote_smtp',
      route_list               => "* mail.${::domain} byname",
      host_find_failed         => 'defer',
      same_domain_copy_routing => 'yes',
      no_more                  => true,
    }

    exim::transport {'remote_smtp':
      driver          => 'smtp',
    }
    exim::retry {'*':}
  }
}
