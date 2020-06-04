# == class: exim
#
# This module configures exim
#
# === Parameters
#
# [*acl_not_smtp*]
#   Name of acl used for local generated mail. (sendmail)
#
# [*acl_smtp_auth*]
#   Name of acl used for auth checking
#   Type: string
#
# [*acl_smtp_data*]
#   Name of acl used for data checking
#     (runs after SMTP "." command)
#   Type: string
#
# [*acl_smtp_mail*]
#   Name of acl used for mail checking
#     (runs after SMTP "MAIL FROM:" command)
#   Type: string
#
# [*acl_smtp_mime*]
#   Name of acl used for maime checking
#   Type: string
#
# [*acl_smtp_rcpt*]
#   Name of acl used for rcpt checking.
#     (runs after SMTP "RCPT TO:" command)
#   Type: string
#
# [*allow_mx_to_ip*]
#   Using an ip instead of an fqdn in DNS MX records violates the RFC,
#   this option allows sending mails to these domains anyways.
#   Type: bool
#
# [*auto_thaw*]
#   Thaw frozen mails in our mailq after this time
#   Type: string
#   Example: "5d"
#
# [*av_scanner*]
#   Configure your av-scanner here
#   Type: string
#   Example: "clamd:/var/run/clamav/clamd.ctl"
#
# [*callout_domain_positive_expire*]
#   SMTP callouts are cached, this options sets the time after a successfull
#   callout is deleted from the cache.
#   Type: string
#   Example: "4h"
#
# [*check_spool_space*]
#   Don't accept mails, if spool space falls below this watermark.
#   Type: string
#   Example: 1G
#
# [*chunink_advertise_hosts*]
#   advertise CHUNKING to these hosts
#   Type: array
#   Example: ['10.0.0.1', '192.168.178.1']
#
# [*config_path*]
#   Path to exims config file, this can be used to create an alternate config file
#   for testing purposes.
#   Type: string
#   Example: "/etc/exim4/exim4.conf_test"
#
# [*daemon_smtp_ports*]
#   SMTP ports to listen on
#   Type: array
#   Example: ['25','587']
#
# [*defaults*]
#   Use a default configuration, this creates a simple default config,
#   which accepts local mails and forwards it to mail.<domain of your server>
#   You probably want to set this to false, and build your own config.
#   Type: bool
#   Default: true
#
# [*delay_warning*]
#   Send a warning Mail to the sender, if mails are delayed for this long:
#   Type: Array
#   Example: ['4h','8h','24h']
#
# [*deliver_queue_load_max*]
#   Stop running the queue if load is higher than this value
#   Type: integer
#
# [*disable_ipv6*]
#   Do no IPv6 processing
#   Type: bool
#
# [*errors_reply_to*]
#   This sets a mail-address to be used in the reply-to header of bounce-messages.
#   Type: String
#   Example: postmaster@example.com
#
# [*extract_addresses_remove_arguments*]
#   When using exims -t option, rcpts from the Mail-Headers are used, and rcpts given
#   on the command-line are substracted, setting this to false will add the rcpts instead
#   of substracting them
#
# [*freeze_tell*]
#   If a mail gets frozen, send a notification to the address defined here.
#
# [*gnutls_compat_mode*]
#   This controls if gnutls is used in compatiblity mode.
#   Set this to true to slightly reduce security, but improve compatiblity with older
#   TLS implementations.
#   Type: bool
#
# [*openssl_options*]
#   Adjust OpenSSL compatibility options.
#   Type: String
#
# [*heavy*]
#   Install the debian heavy variant, default is false
#   does nothing for redhat
#
# [*helo_allow_chars*]
#   Allow additional characters in remote HELO strings.
#   Type: string
#
# [*host_lookup*]
#   Reverse lookup hostname of ips.
#   Type: Array
#   Example: '*'
#
# [*hosts_treat_as_local*]
#   Treat these hosts, as if they where the local host.
#   default is empty
#
# [*ignore_bounce_errors_after*]
#   Discard undeliverable bounce messages after this time
#   Type String:
#   Example: "12d"
#
# [*includes*]
#   Include additional config file snippets, files defined here will be included at
#   the top of the configuration, but below macros.
#
# [*local_from_check*]
#   Check and correct From: header from local mails to username@qualify-domain
#
# [*local_interfaces*]
#   Specifies the interfaces exim will listen on.
#
# [*log_file_path*']
#   Type: string
#
# [*log_lost_incoming_connection*]
#   Configures the log_selector to log timeouting incomming connections
#
# [*log_retry_defer*]
#   Configures the log_selector to log if the queue runner skips a mail
#   because it's retry time is not yet reached.
#
# [*log_sender_on_delivery*]
#   add sender to => lines
#
# [*log_skip_delivery*]
#   delivery skipped in a queue run
#
# [*log_smtp_confirmation*]
#   SMTP confirmation on => lines
#
# [*log_smtp_connection*]
#   Log SMTP connections.
#
# [*log_smtp_protocol_error*]
#   Log SMTP protocol errors.
#
# [*log_smtp_syntax_error*]
#   Log SMTP syntax errors.
#
# [*log_tls_peerdn*]
#   TLS peer DN on <= and => lines
#
# [*log_mail_subject*]
#   Log mail subjects.
#
# [*log_8bitmime*] 
#   received 8BITMIME status
#
# [*log_acl_warn_skipped*]
#   skipped warn statement in ACL
#
# [*log_address_rewrite*]           
#   address rewriting
#
# [*log_all_parents*]            
#   all parents in => lines
#
# [*log_arguments*]                
#   command line arguments
#
# [*log_connection_reject*]
#   connection rejections
#
# [*log_delay_delivery*]          
#   immediate delivery delayed
#
# [*log_deliver_time*]             
#   time taken to perform delivery
#
# [*log_delivery_size*]               
#   add S=nnn to => lines
#
# [*log_dnslist_defer*]              
#   defers of DNS list (aka RBL) lookups
#
# [*log_dnssec*]              
#   DNSSEC secured lookups
#
# [*log_etrn*]                     
#   ETRN commands
#
# [*log_host_lookup_failed*]
#   Log failed host lookup
#
# [*log_ident_timeout*]         
#   timeout for ident connection
#
# [*log_incoming_interface*]
#   local interface on <= and => lines
#
# [*log_incoming_port*]         
#   remote port on <= lines
#
# [*log_millisec*]              
#   millisecond timestamps and QT,DT,D times
#
# [*log_outgoing_interface*]
#   local interface on => lines
#
# [*log_outgoing_port*]         
#   add remote port to => lines
#
# [*log_queue_run*]              
#   start and end queue runs
#
# [*log_queue_time*]                  
#   time on queue for one recipient
#
# [*log_queue_time_overall*]
#   time on queue for whole message
#
# [*log_pid*]         
#   Exim process id
#
# [*log_proxy*]
#   proxy address on <= and => lines
#
# [*log_received_recipients*]
#   recipients on <= lines
#
# [*log_received_sender*]        
#   sender on <= lines
#
# [*log_rejected_header*]            
#   header contents on reject log
#
# [*log_return_path_on_delivery*]
#   put return path on => and ** lines
#
# [*log_sender_verify_fail*]    
#   sender verification failures
#
# [*log_size_reject*]         
#   rejection because too big
#
# [*log_smtp_incomplete_transaction*]
#   incomplete SMTP transactions
#
# [*log_smtp_mailauth*]
#   AUTH argument to MAIL commands
#
# [*log_smtp_no_mail*]              
#   session with no MAIL commands
#
# [*log_tls_certificate_verified*]
#   certificate verification status
#
# [*log_tls_cipher*]   
#   TLS cipher suite on <= and => lines
#
# [*log_tls_sni*]                 
#   TLS SNI on <= lines
#
# [*log_unknown_in_list*]
#   DNS lookup failed in list match
#
# [*macros*]
#   Allows you to set Macro definitions, note that macros must
#   start with an uppercase letter
#
# [*manage_service*]
#   Manage exim Service
#
# [*message_logs*]
#   This stores an aditional log file with each message in the spool file
#   which enables you to instantly get all logs from a message in your
#   queue by using the exim -Mvl option.
#
# [*message_size_limit*]
#   Max size allowed for mails, default is empty
#   Example: 100M
#
# [*never_users*]
#   Do not run deliverys as these users
#   Type: array
#
# [*qualify_domain*]
#   configure the domain, which is automatically added to email addresses
#   without a domain part. Default is empty, which exim treats as the
#   primary hostname.
#
# [*queue_only_load*]
#   Do not run imediate deliveries if load is above this threshhold.
#   Type: integer
#
# [*queue_run_max*]
#   Limits the number of queue runners to run in parrallel.
#   Type: integer
#
# [*remote_max_parallel*]
#   If one message with multiple recipients is delivered, run at max these
#   deliveries in parallel.
#
# [*rfc1413_hosts*]
#   use identd callback on these hosts.
#   Type: array
#
# [*rfc1413_query_timeout*]
#   Timeout for identd callback
#
# [*smtp_accept_max*]
#   Limit on incomming connections
#   Type: integer
#
# [*smtp_accept_max_nonmail*]
#   Limit the amount of non-mail commands in smtp dialog
#   Type: integer
#
# [*smtp_accept_max_per_connection*]
#   Maximum number of Mails accepted in a single connection.
#
# [*smtp_accept_max_per_host*]
#   Maximum number of parrallel connections from a single host
#
# [*smtp_accept_queue*]
#   If the number of simultaneous incoming SMTP connections being handled via the
#   listening daemon exceeds this value, messages received by SMTP are just
#   placed on the queue.
#
# [*smtp_accept_queue_per_connection*]
#   Maximum number of delivery processes spawned for a single smtp connection
#
# [*smtp_accept_reserve*]
#   When smtp_accept_max is set greater than zero, this option specifies a number
#   of SMTP connections that are reserved for connections from the hosts that
#   are specified in smtp_reserve_hosts.
#
# [*smtp_banner*]
#   Initial response to SMTP connections.
#
# [*smtp_reserve_hosts*]
#   See "smtp_accept_reserve"
#
# [*spamd_address*]
#   Configure a spamd socket here.
#
# [*split_spool_directory*]
#   Use split spool configuration
#   Type: bool
#
# [*syslog_timestamp*]
#   Don't send timestamps to syslog.
#
# [*system_filter*]
#   Configure a system filter file here.
#
# [*timeout_frozen_after*]
#   Discard frozen mails after this amount of time.
#
# [*tls_advertise_hosts*]
#   Advertise tls to hosts in this list
#
# [*tls_certificate*]
#   Path to crt file, must be used together with tls_privatekey, default is empty (no tls)
#
# [*tls_privatekey*]
#   Path to key file, must be used together with tls_certificate, default is empty (no tls)
#
# [*trusted_users*]
#   Set, to configure exims global config variable trusted_users,
#   default is empty ('').
#
# [*print_topbitchars*]
#   If this option ist set to true code values of 128 and above are also considered to be printing characters
#
# [*untrusted_set_sender*]
#   This option allows you to permit untrusted users to set other envelope sender addresses in a controlled way.
#
# [*tls_require_ciphers*]
#   This option controls which ciphers can be used for incoming TLS connections.
#
# === Examples
#  class { 'noris_exim':
#  }

class exim (
  $acl_not_smtp                       =$::exim::params::acl_not_smtp,
  $acl_smtp_auth                      =$::exim::params::acl_smtp_auth,
  $acl_smtp_data                      =$::exim::params::acl_smtp_data,
  $acl_smtp_mail                      =$::exim::params::acl_smtp_mail,
  $acl_smtp_mime                      =$::exim::params::acl_smtp_mime,
  $acl_smtp_rcpt                      =$::exim::params::acl_smtp_rcpt,
  $allow_mx_to_ip                     =$::exim::params::allow_mx_to_ip,
  $auto_thaw                          =$::exim::params::auto_thaw,
  $av_scanner                         =$::exim::params::av_scanner,
  $callout_domain_positive_expire     =$::exim::params::callout_domain_positive_expire,
  $check_spool_space                  =$::exim::params::check_spool_space,
  $chunking_advertise_hosts           =$::exim::params::chunking_advertise_hosts,
  $queue_smtp_domains                 =$::exim::params::queue_smtp_domains,
  $config_path                        =$::exim::params::config_path,
  $daemon_smtp_ports                  =$::exim::params::daemon_smtp_ports,
  $defaults                           =$::exim::params::defaults,
  $delay_warning                      =$::exim::params::delay_warning,
  $deliver_queue_load_max             =$::exim::params::deliver_queue_load_max,
  $disable_ipv6                       =$::exim::params::disable_ipv6,
  $errors_reply_to                    =$::exim::params::errors_reply_to,
  $extract_addresses_remove_arguments =$::exim::params::extract_addresses_remove_arguments,
  $freeze_tell                        =$::exim::params::freeze_tell,
  $gnutls_compat_mode                 =$::exim::params::gnutls_compat_mode,
  $openssl_options                    =$::exim::params::openssl_options,
  $heavy                              =$::exim::params::heavy,
  $helo_allow_chars                   =$::exim::params::helo_allow_chars,
  $host_lookup                        =$::exim::params::host_lookup,
  $hosts_treat_as_local               =$::exim::params::hosts_treat_as_local,
  $ignore_bounce_errors_after         =$::exim::params::ignore_bounce_errors_after,
  $includes                           =$::exim::params::includes,
  $ldap_default_servers               =$::exim::params::ldap_default_servers,
  $local_from_check                   =$::exim::params::local_from_check,
  $local_interfaces                   =$::exim::params::local_interfaces,
  $log_file_path                      =$::exim::params::log_file_path,
  $log_lost_incoming_connection       =$::exim::params::log_lost_incoming_connection,
  $log_retry_defer                    =$::exim::params::log_retry_defer,
  $log_sender_on_delivery             =$::exim::params::log_sender_on_delivery,
  $log_skip_delivery                  =$::exim::params::log_skip_delivery,
  $log_smtp_confirmation              =$::exim::params::log_smtp_confirmation,
  $log_smtp_connection                =$::exim::params::log_smtp_connection,
  $log_smtp_protocol_error            =$::exim::params::log_smtp_protocol_error,
  $log_smtp_syntax_error              =$::exim::params::log_smtp_syntax_error,
  $log_tls_peerdn                     =$::exim::params::log_tls_peerdn,
  $log_mail_subject                   =$::exim::params::log_mail_subject,
  $log_8bitmime                       =$::exim::params::log_8bitmime,
  $log_acl_warn_skipped               =$::exim::params::log_acl_warn_skipped,
  $log_address_rewrite                =$::exim::params::log_address_rewrite,
  $log_all_parents                    =$::exim::params::log_all_parents,
  $log_arguments                      =$::exim::params::log_arguments,
  $log_connection_reject              =$::exim::params::log_connection_reject,
  $log_delay_delivery                 =$::exim::params::log_delay_delivery,
  $log_deliver_time                   =$::exim::params::log_deliver_time,
  $log_delivery_size                  =$::exim::params::log_delivery_size,
  $log_dnslist_defer                  =$::exim::params::log_dnslist_defer,
  $log_dnssec                         =$::exim::params::log_dnssec,
  $log_etrn                           =$::exim::params::log_etrn,
  $log_host_lookup_failed             =$::exim::params::log_host_lookup_failed,
  $log_ident_timeout                  =$::exim::params::log_ident_timeout,
  $log_incoming_interface             =$::exim::params::log_incoming_interface,
  $log_incoming_port                  =$::exim::params::log_incoming_port,
  $log_millisec                       =$::exim::params::log_millisec,
  $log_outgoing_interface             =$::exim::params::log_outgoing_interface,
  $log_outgoing_port                  =$::exim::params::log_outgoing_port,
  $log_queue_run                      =$::exim::params::log_queue_run,
  $log_queue_time                     =$::exim::params::log_queue_time,
  $log_queue_time_overall             =$::exim::params::log_queue_time_overall,
  $log_pid                            =$::exim::params::log_pid,
  $log_proxy                          =$::exim::params::log_proxy,
  $log_received_recipients            =$::exim::params::log_received_recipients,
  $log_received_sender                =$::exim::params::log_received_sender,
  $log_rejected_header                =$::exim::params::log_rejected_header,
  $log_return_path_on_delivery        =$::exim::params::log_return_path_on_delivery,
  $log_sender_verify_fail             =$::exim::params::log_sender_verify_fail,
  $log_size_reject                    =$::exim::params::log_size_reject,
  $log_smtp_incomplete_transaction    =$::exim::params::log_smtp_incomplete_transaction,
  $log_smtp_mailauth                  =$::exim::params::log_smtp_mailauth,
  $log_smtp_no_mail                   =$::exim::params::log_smtp_no_mail,
  $log_timezone                       =$::exim::params::log_timezone,
  $log_tls_certificate_verified       =$::exim::params::log_tls_certificate_verified,
  $log_tls_cipher                     =$::exim::params::log_tls_cipher,
  $log_tls_sni                        =$::exim::params::log_tls_sni,
  $log_unknown_in_list                =$::exim::params::log_unknown_in_list,
  $macros                             =$::exim::params::macros,
  $manage_service                     =$::exim::params::manage_service,
  $message_logs                       =$::exim::params::message_logs,
  $message_size_limit                 =$::exim::params::message_size_limit,
  $never_users                        =$::exim::params::never_users,
  $untrusted_set_sender               =$::exim::params::untrusted_set_sender,
  $print_topbitchars                  =$::exim::params::print_topbitchars,
  $tls_require_ciphers                =$::exim::params::tls_require_ciphers,
  $qualify_domain                     =$::exim::params::qualify_domain,
  $queue_only_load                    =$::exim::params::queue_only_load,
  $queue_run_max                      =$::exim::params::queue_run_max,
  $remote_max_parallel                =$::exim::params::remote_max_parallel,
  $rfc1413_hosts                      =$::exim::params::rfc1413_hosts,
  $rfc1413_query_timeout              =$::exim::params::rfc1413_query_timeout,
  $smtp_accept_max                    =$::exim::params::smtp_accept_max,
  $smtp_accept_max_nonmail            =$::exim::params::smtp_accept_max_nonmail,
  $smtp_accept_max_per_connection     =$::exim::params::smtp_accept_max_per_connection,
  $smtp_accept_max_per_host           =$::exim::params::smtp_accept_max_per_host,
  $smtp_accept_queue                  =$::exim::params::smtp_accept_queue,
  $smtp_accept_queue_per_connection   =$::exim::params::smtp_accept_queue_per_connection,
  $smtp_accept_reserve                =$::exim::params::smtp_accept_reserve,
  $smtp_banner                        =$::exim::params::smtp_banner,
  $smtp_reserve_hosts                 =$::exim::params::smtp_reserve_hosts,
  $spamd_address                      =$::exim::params::spamd_address,
  $split_spool_directory              =$::exim::params::split_spool_directory,
  $syslog_timestamp                   =$::exim::params::syslog_timestamp,
  $system_filter                      =$::exim::params::system_filter,
  $timeout_frozen_after               =$::exim::params::timeout_frozen_after,
  $tls_advertise_hosts                =$::exim::params::tls_advertise_hosts,
  $tls_certificate                    =$::exim::params::tls_certificate,
  $tls_privatekey                     =$::exim::params::tls_privatekey,
  $trusted_users                      =$::exim::params::trusted_users,
) inherits exim::params {

  if ($daemon_smtp_ports)  { validate_array($daemon_smtp_ports) }

  if ($gnutls_compat_mode) { validate_bool($gnutls_compat_mode) }

  if ($smtp_accept_max_nonmail)        { validate_re("x${smtp_accept_max_nonmail}"        ,'^x[0-9]+$') }
  if ($smtp_accept_max_per_connection) { validate_re("x${smtp_accept_max_per_connection}" ,'^x[0-9]+$') }

  class {'exim::install':}
  -> class {'exim::config': }
  ~> class {'exim::service':}
}
