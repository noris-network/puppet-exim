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

  if $::exim::log_lost_incoming_connection.is_bool { $log_lost_incoming_connection = bool2str($::exim::log_lost_incoming_connection) } else { $log_lost_incoming_connection = $::exim::log_lost_incoming_connection }
  if $::exim::log_retry_defer.is_bool { $log_retry_defer = bool2str($::exim::log_retry_defer) } else { $log_retry_defer = $::exim::log_retry_defer }
  if $::exim::log_sender_on_delivery.is_bool { $log_sender_on_delivery = bool2str($::exim::log_sender_on_delivery) } else { $log_sender_on_delivery = $::exim::log_sender_on_delivery }
  if $::exim::log_skip_delivery.is_bool { $log_skip_delivery = bool2str($::exim::log_skip_delivery) } else { $log_skip_delivery = $::exim::log_skip_delivery }
  if $::exim::log_smtp_confirmation.is_bool { $log_smtp_confirmation = bool2str($::exim::log_smtp_confirmation) } else { $log_smtp_confirmation = $::exim::log_smtp_confirmation }
  if $::exim::log_smtp_connection.is_bool { $log_smtp_connection = bool2str($::exim::log_smtp_connection) } else { $log_smtp_connection = $::exim::log_smtp_connection }
  if $::exim::log_smtp_protocol_error.is_bool { $log_smtp_protocol_error = bool2str($::exim::log_smtp_protocol_error) } else { $log_smtp_protocol_error = $::exim::log_smtp_protocol_error }
  if $::exim::log_smtp_syntax_error.is_bool { $log_smtp_syntax_error = bool2str($::exim::log_smtp_syntax_error) } else { $log_smtp_syntax_error = $::exim::log_smtp_syntax_error }
  if $::exim::log_tls_peerdn.is_bool { $log_tls_peerdn = bool2str($::exim::log_tls_peerdn) } else { $log_tls_peerdn = $::exim::log_tls_peerdn }
  if $::exim::log_mail_subject.is_bool { $log_mail_subject = bool2str($::exim::log_mail_subject) } else { $log_mail_subject = $::exim::log_mail_subject }
  if $::exim::log_8bitmime.is_bool { $log_8bitmime = bool2str($::exim::log_8bitmime) } else { $log_8bitmime = $::exim::log_8bitmime }
  if $::exim::log_acl_warn_skipped.is_bool { $log_acl_warn_skipped = bool2str($::exim::log_acl_warn_skipped) } else { $log_acl_warn_skipped = $::exim::log_acl_warn_skipped }
  if $::exim::log_address_rewrite.is_bool { $log_address_rewrite = bool2str($::exim::log_address_rewrite) } else { $log_address_rewrite = $::exim::log_address_rewrite }
  if $::exim::log_all_parents.is_bool { $log_all_parents = bool2str($::exim::log_all_parents) } else { $log_all_parents = $::exim::log_all_parents }
  if $::exim::log_arguments.is_bool { $log_arguments = bool2str($::exim::log_arguments) } else { $log_arguments = $::exim::log_arguments }
  if $::exim::log_connection_reject.is_bool { $log_connection_reject = bool2str($::exim::log_connection_reject) } else { $log_connection_reject = $::exim::log_connection_reject }
  if $::exim::log_delay_delivery.is_bool { $log_delay_delivery = bool2str($::exim::log_delay_delivery) } else { $log_delay_delivery = $::exim::log_delay_delivery }
  if $::exim::log_deliver_time.is_bool { $log_deliver_time = bool2str($::exim::log_deliver_time) } else { $log_deliver_time = $::exim::log_deliver_time }
  if $::exim::log_delivery_size.is_bool { $log_delivery_size = bool2str($::exim::log_delivery_size) } else { $log_delivery_size = $::exim::log_delivery_size }
  if $::exim::log_dnslist_defer.is_bool { $log_dnslist_defer = bool2str($::exim::log_dnslist_defer) } else { $log_dnslist_defer = $::exim::log_dnslist_defer }
  if $::exim::log_dnssec.is_bool { $log_dnssec = bool2str($::exim::log_dnssec) } else { $log_dnssec = $::exim::log_dnssec }
  if $::exim::log_etrn.is_bool { $log_etrn = bool2str($::exim::log_etrn) } else { $log_etrn = $::exim::log_etrn }
  if $::exim::log_host_lookup_failed.is_bool { $log_host_lookup_failed = bool2str($::exim::log_host_lookup_failed) } else { $log_host_lookup_failed = $::exim::log_host_lookup_failed }
  if $::exim::log_ident_timeout.is_bool { $log_ident_timeout = bool2str($::exim::log_ident_timeout) } else { $log_ident_timeout = $::exim::log_ident_timeout }
  if $::exim::log_incoming_interface.is_bool { $log_incoming_interface = bool2str($::exim::log_incoming_interface) } else { $log_incoming_interface = $::exim::log_incoming_interface }
  if $::exim::log_incoming_port.is_bool { $log_incoming_port = bool2str($::exim::log_incoming_port) } else { $log_incoming_port = $::exim::log_incoming_port }
  if $::exim::log_millisec.is_bool { $log_millisec = bool2str($::exim::log_millisec) } else { $log_millisec = $::exim::log_millisec }
  if $::exim::log_outgoing_interface.is_bool { $log_outgoing_interface = bool2str($::exim::log_outgoing_interface) } else { $log_outgoing_interface = $::exim::log_outgoing_interface }
  if $::exim::log_outgoing_port.is_bool { $log_outgoing_port = bool2str($::exim::log_outgoing_port) } else { $log_outgoing_port = $::exim::log_outgoing_port }
  if $::exim::log_queue_run.is_bool { $log_queue_run = bool2str($::exim::log_queue_run) } else { $log_queue_run = $::exim::log_queue_run }
  if $::exim::log_queue_time.is_bool { $log_queue_time = bool2str($::exim::log_queue_time) } else { $log_queue_time = $::exim::log_queue_time }
  if $::exim::log_queue_time_overall.is_bool { $log_queue_time_overall = bool2str($::exim::log_queue_time_overall) } else { $log_queue_time_overall = $::exim::log_queue_time_overall }
  if $::exim::log_pid.is_bool { $log_pid = bool2str($::exim::log_pid) } else { $log_pid = $::exim::log_pid }
  if $::exim::log_proxy.is_bool { $log_proxy = bool2str($::exim::log_proxy) } else { $log_proxy = $::exim::log_proxy }
  if $::exim::log_received_recipients.is_bool { $log_received_recipients = bool2str($::exim::log_received_recipients) } else { $log_received_recipients = $::exim::log_received_recipients }
  if $::exim::log_received_sender.is_bool { $log_received_sender = bool2str($::exim::log_received_sender) } else { $log_received_sender = $::exim::log_received_sender }
  if $::exim::log_rejected_header.is_bool { $log_rejected_header = bool2str($::exim::log_rejected_header) } else { $log_rejected_header = $::exim::log_rejected_header }
  if $::exim::log_return_path_on_delivery.is_bool { $log_return_path_on_delivery = bool2str($::exim::log_return_path_on_delivery) } else { $log_return_path_on_delivery = $::exim::log_return_path_on_delivery }
  if $::exim::log_sender_verify_fail.is_bool { $log_sender_verify_fail = bool2str($::exim::log_sender_verify_fail) } else { $log_sender_verify_fail = $::exim::log_sender_verify_fail }
  if $::exim::log_size_reject.is_bool { $log_size_reject = bool2str($::exim::log_size_reject) } else { $log_size_reject = $::exim::log_size_reject }
  if $::exim::log_smtp_incomplete_transaction.is_bool { $log_smtp_incomplete_transaction = bool2str($::exim::log_smtp_incomplete_transaction) } else { $log_smtp_incomplete_transaction = $::exim::log_smtp_incomplete_transaction }
  if $::exim::log_smtp_mailauth.is_bool { $log_smtp_mailauth = bool2str($::exim::log_smtp_mailauth) } else { $log_smtp_mailauth = $::exim::log_smtp_mailauth }
  if $::exim::log_smtp_no_mail.is_bool { $log_smtp_no_mail = bool2str($::exim::log_smtp_no_mail) } else { $log_smtp_no_mail = $::exim::log_smtp_no_mail }
  if $::exim::log_tls_certificate_verified.is_bool { $log_tls_certificate_verified = bool2str($::exim::log_tls_certificate_verified) } else { $log_tls_certificate_verified = $::exim::log_tls_certificate_verified }
  if $::exim::log_tls_cipher.is_bool { $log_tls_cipher = bool2str($::exim::log_tls_cipher) } else { $log_tls_cipher = $::exim::log_tls_cipher }
  if $::exim::log_tls_sni.is_bool { $log_tls_sni = bool2str($::exim::log_tls_sni) } else { $log_tls_sni = $::exim::log_tls_sni }
  if $::exim::log_unknown_in_list.is_bool { $log_unknown_in_list = bool2str($::exim::log_unknown_in_list) } else { $log_unknown_in_list = $::exim::log_unknown_in_list }

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
