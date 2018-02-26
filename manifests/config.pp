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
  $log_lost_incoming_connection       =$::exim::log_lost_incoming_connection
  $log_retry_defer                    =$::exim::log_retry_defer
  $log_sender_on_delivery             =$::exim::log_sender_on_delivery
  $log_skip_delivery                  =$::exim::log_skip_delivery
  $log_smtp_confirmation              =$::exim::log_smtp_confirmation
  $log_smtp_connection                =$::exim::log_smtp_connection
  $log_smtp_protocol_error            =$::exim::log_smtp_protocol_error
  $log_smtp_syntax_error              =$::exim::log_smtp_syntax_error
  $log_tls_peerdn                     =$::exim::log_tls_peerdn
  $log_mail_subject                   =$::exim::log_mail_subject
  $log_8bitmime                       =$::exim::log_8bitmime
  $log_acl_warn_skipped               =$::exim::log_acl_warn_skipped
  $log_address_rewrite                =$::exim::log_address_rewrite
  $log_all_parents                    =$::exim::log_all_parents
  $log_arguments                      =$::exim::log_arguments
  $log_connection_reject              =$::exim::log_connection_reject
  $log_delay_delivery                 =$::exim::log_delay_delivery
  $log_deliver_time                   =$::exim::log_deliver_time
  $log_delivery_size                  =$::exim::log_delivery_size
  $log_dnslist_defer                  =$::exim::log_dnslist_defer
  $log_dnssec                         =$::exim::log_dnssec
  $log_etrn                           =$::exim::log_etrn
  $log_host_lookup_failed             =$::exim::log_host_lookup_failed
  $log_ident_timeout                  =$::exim::log_ident_timeout
  $log_incoming_interface             =$::exim::log_incoming_interface
  $log_incoming_port                  =$::exim::log_incoming_port
  $log_millisec                       =$::exim::log_millisec
  $log_outgoing_interface             =$::exim::log_outgoing_interface
  $log_outgoing_port                  =$::exim::log_outgoing_port
  $log_queue_run                      =$::exim::log_queue_run
  $log_queue_time                     =$::exim::log_queue_time
  $log_queue_time_overall             =$::exim::log_queue_time_overall
  $log_pid                            =$::exim::log_pid
  $log_proxy                          =$::exim::log_proxy
  $log_received_recipients            =$::exim::log_received_recipients
  $log_received_sender                =$::exim::log_received_sender
  $log_rejected_header                =$::exim::log_rejected_header
  $log_return_path_on_delivery        =$::exim::log_return_path_on_delivery
  $log_sender_verify_fail             =$::exim::log_sender_verify_fail
  $log_size_reject                    =$::exim::log_size_reject
  $log_smtp_incomplete_transaction    =$::exim::log_smtp_incomplete_transaction
  $log_smtp_mailauth                  =$::exim::log_smtp_mailauth
  $log_smtp_no_mail                   =$::exim::log_smtp_no_mail
  $log_tls_certificate_verified       =$::exim::log_tls_certificate_verified
  $log_tls_cipher                     =$::exim::log_tls_cipher
  $log_tls_sni                        =$::exim::log_tls_sni
  $log_unknown_in_list                =$::exim::log_unknown_in_list
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
