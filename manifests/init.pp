# @summary This module configures exim
#
# @param acl_not_smtp
#   Name of acl used for local generated mail. (sendmail)
#
# @param acl_smtp_auth
#   Name of acl used for auth checking
#   Type: string
#
# @param acl_smtp_data
#   Name of acl used for data checking
#     (runs after SMTP "." command)
#   Type: string
#
# @param acl_smtp_mail
#   Name of acl used for mail checking
#     (runs after SMTP "MAIL FROM:" command)
#   Type: string
#
# @param acl_smtp_mime
#   Name of acl used for maime checking
#   Type: string
#
# @param acl_smtp_rcpt
#   Name of acl used for rcpt checking.
#     (runs after SMTP "RCPT TO:" command)
#   Type: string
#
# @param allow_mx_to_ip
#   Using an ip instead of an fqdn in DNS MX records violates the RFC,
#   this option allows sending mails to these domains anyways.
#   Type: bool
#
# @param auto_thaw
#   Thaw frozen mails in our mailq after this time
#   Type: string
#   Example: "5d"
#
# @param av_scanner
#   Configure your av-scanner here
#   Type: string
#   Example: "clamd:/var/run/clamav/clamd.ctl"
#
# @param callout_domain_positive_expire
#   SMTP callouts are cached, this options sets the time after a successfull
#   callout is deleted from the cache.
#   Type: string
#   Example: "4h"
#
# @param check_spool_space
#   Don't accept mails, if spool space falls below this watermark.
#   Type: string
#   Example: 1G
#
# @param chunking_advertise_hosts
#   advertise CHUNKING to these hosts
#   Type: array
#   Example: ['10.0.0.1', '192.168.178.1']
#
# @param queue_smtp_domains
#   no immediaste SMTP delivery for these domains
#   Type: array
#   Example: ['10.0.0.1', '192.168.178.1']
#
# @param config_path
#   Path to exims config file, this can be used to create an alternate config file
#   for testing purposes.
#   Type: string
#   Example: "/etc/exim4/exim4.conf_test"
#
# @param daemon_smtp_ports
#   SMTP ports to listen on
#   Type: array of integers
#   Example: [25,587]
#
# @param defaults
#   Use a default configuration, this creates a simple default config,
#   which accepts local mails and forwards it to mail.<domain of your server>
#   You probably want to set this to false, and build your own config.
#   Type: bool
#   Default: true
#
# @param delay_warning
#   Send a warning Mail to the sender, if mails are delayed for this long:
#   Type: Array
#   Example: ['4h','8h','24h']
#
# @param deliver_queue_load_max
#   Stop running the queue if load is higher than this value
#   Type: integer
#
# @param disable_ipv6
#   Do no IPv6 processing
#   Type: bool
#
# @param errors_reply_to
#   This sets a mail-address to be used in the reply-to header of bounce-messages.
#   Type: String
#   Example: postmaster@example.com
#
# @param extract_addresses_remove_arguments
#   When using exims -t option, rcpts from the Mail-Headers are used, and rcpts given
#   on the command-line are substracted, setting this to false will add the rcpts instead
#   of substracting them
#
# @param freeze_tell
#   If a mail gets frozen, send a notification to the address defined here.
#
# @param gnutls_compat_mode
#   This controls if gnutls is used in compatiblity mode.
#   Set this to true to slightly reduce security, but improve compatiblity with older
#   TLS implementations.
#   Type: bool
#
# @param openssl_options
#   Adjust OpenSSL compatibility options.
#   Type: String
#
# @param heavy
#   Install the debian heavy variant, default is false
#   does nothing for redhat
#
# @param helo_allow_chars
#   Allow additional characters in remote HELO strings.
#   Type: string
#
# @param host_lookup
#   Reverse lookup hostname of ips.
#   Type: String
#   Example: '*'
#
# @param hosts_treat_as_local
#   Treat these hosts, as if they where the local host.
#   default is empty
#
# @param ignore_bounce_errors_after
#   Discard undeliverable bounce messages after this time
#   Type String:
#   Example: "12d"
#
# @param includes
#   Include additional config file snippets, files defined here will be included at
#   the top of the configuration, but below macros.
#
# @param local_from_check
#   Check and correct From: header from local mails to username@qualify-domain
#
# @param local_interfaces
#   Specifies the interfaces exim will listen on.
#
# @param log_file_path
#   Type: string
#
# @param log_lost_incoming_connection
#   Configures the log_selector to log timeouting incomming connections
#
# @param log_retry_defer
#   Configures the log_selector to log if the queue runner skips a mail
#   because it's retry time is not yet reached.
#
# @param log_sender_on_delivery
#   add sender to => lines
#
# @param log_skip_delivery
#   delivery skipped in a queue run
#
# @param log_smtp_confirmation
#   SMTP confirmation on => lines
#
# @param log_smtp_connection
#   Log SMTP connections.
#
# @param log_smtp_protocol_error
#   Log SMTP protocol errors.
#
# @param log_smtp_syntax_error
#   Log SMTP syntax errors.
#
# @param log_tls_peerdn
#   TLS peer DN on <= and => lines
#
# @param log_mail_subject
#   Log mail subjects.
#
# @param log_8bitmime
#   received 8BITMIME status
#
# @param log_acl_warn_skipped
#   skipped warn statement in ACL
#
# @param log_address_rewrite
#   address rewriting
#
# @param log_all_parents
#   all parents in => lines
#
# @param log_arguments
#   command line arguments
#
# @param log_connection_reject
#   connection rejections
#
# @param log_delay_delivery
#   immediate delivery delayed
#
# @param log_deliver_time
#   time taken to perform delivery
#
# @param log_delivery_size
#   add S=nnn to => lines
#
# @param log_dnslist_defer
#   defers of DNS list (aka RBL) lookups
#
# @param log_dnssec
#   DNSSEC secured lookups
#
# @param log_etrn
#   ETRN commands
#
# @param log_host_lookup_failed
#   Log failed host lookup
#
# @param log_ident_timeout
#   timeout for ident connection
#
# @param log_incoming_interface
#   local interface on <= and => lines
#
# @param log_incoming_port
#   remote port on <= lines
#
# @param log_millisec
#   millisecond timestamps and QT,DT,D times
#
# @param log_outgoing_interface
#   local interface on => lines
#
# @param log_outgoing_port
#   add remote port to => lines
#
# @param log_queue_run
#   start and end queue runs
#
# @param log_queue_time
#   time on queue for one recipient
#
# @param log_queue_time_overall
#   time on queue for whole message
#
# @param log_pid
#   Exim process id
#
# @param log_proxy
#   proxy address on <= and => lines
#
# @param log_received_recipients
#   recipients on <= lines
#
# @param log_received_sender
#   sender on <= lines
#
# @param log_rejected_header
#   header contents on reject log
#
# @param log_return_path_on_delivery
#   put return path on => and ** lines
#
# @param log_sender_verify_fail
#   sender verification failures
#
# @param log_size_reject
#   rejection because too big
#
# @param log_smtp_incomplete_transaction
#   incomplete SMTP transactions
#
# @param log_smtp_mailauth
#   AUTH argument to MAIL commands
#
# @param log_smtp_no_mail
#   session with no MAIL commands
#
# @param log_tls_certificate_verified
#   certificate verification status
#
# @param log_tls_cipher
#   TLS cipher suite on <= and => lines
#
# @param log_tls_sni
#   TLS SNI on <= lines
#
# @param log_unknown_in_list
#   DNS lookup failed in list match
#
# @param log_timezone
#   Timezone
#
# @param log_file_path
#   File path
#
# @param macros
#   Allows you to set Macro definitions, note that macros must
#   start with an uppercase letter
#
# @param manage_service
#   Manage exim Service
#
# @param message_logs
#   This stores an aditional log file with each message in the spool file
#   which enables you to instantly get all logs from a message in your
#   queue by using the exim -Mvl option.
#
# @param message_size_limit
#   Max size allowed for mails, default is empty
#   Example: 100M
#
# @param never_users
#   Do not run deliverys as these users
#   Type: array
#
# @param qualify_domain
#   configure the domain, which is automatically added to email addresses
#   without a domain part. Default is empty, which exim treats as the
#   primary hostname.
#
# @param queue_only_load
#   Do not run imediate deliveries if load is above this threshhold.
#   Type: integer
#
# @param queue_run_max
#   Limits the number of queue runners to run in parrallel.
#   Type: integer
#
# @param remote_max_parallel
#   If one message with multiple recipients is delivered, run at max these
#   deliveries in parallel.
#
# @param rfc1413_hosts
#   use identd callback on these hosts.
#   Type: array
#
# @param rfc1413_query_timeout
#   Timeout for identd callback
#
# @param smtp_accept_max
#   Limit on incomming connections
#   Type: integer
#
# @param smtp_accept_max_nonmail
#   Limit the amount of non-mail commands in smtp dialog
#   Type: integer
#
# @param smtp_accept_max_per_connection
#   Maximum number of Mails accepted in a single connection.
#
# @param smtp_accept_max_per_host
#   Maximum number of parrallel connections from a single host
#
# @param smtp_accept_queue
#   If the number of simultaneous incoming SMTP connections being handled via the
#   listening daemon exceeds this value, messages received by SMTP are just
#   placed on the queue.
#
# @param smtp_accept_queue_per_connection
#   Maximum number of delivery processes spawned for a single smtp connection
#
# @param smtp_accept_reserve
#   When smtp_accept_max is set greater than zero, this option specifies a number
#   of SMTP connections that are reserved for connections from the hosts that
#   are specified in smtp_reserve_hosts.
#
# @param smtp_banner
#   Initial response to SMTP connections.
#
# @param smtp_reserve_hosts
#   See "smtp_accept_reserve"
#
# @param spamd_address
#   Configure a spamd socket here.
#
# @param split_spool_directory
#   Use split spool configuration
#   Type: bool
#
# @param syslog_timestamp
#   Don't send timestamps to syslog.
#
# @param system_filter
#   Configure a system filter file here.
#
# @param timeout_frozen_after
#   Discard frozen mails after this amount of time.
#
# @param tls_advertise_hosts
#   Advertise tls to hosts in this list
#
# @param tls_certificate
#   Path to crt file, must be used together with tls_privatekey, default is empty (no tls)
#
# @param tls_privatekey
#   Path to key file, must be used together with tls_certificate, default is empty (no tls)
#
# @param trusted_users
#   Set, to configure exims global config variable trusted_users,
#   default is empty ('').
#
# @param print_topbitchars
#   If this option ist set to true code values of 128 and above are also considered to be printing characters
#
# @param untrusted_set_sender
#   This option allows you to permit untrusted users to set other envelope sender addresses in a controlled way.
#
# @param tls_require_ciphers
#   This option controls which ciphers can be used for incoming TLS connections.
#
# @param ldap_default_servers
#   Array of LDAP servers (fqdn)
#
# @param exim_heavy_package
#   Name of the Debian exim-heavy package
#
# @param exim_light_package
#   Name of the Debian exim-light package
#
# @param exim_service
#   Name of the service
#
# @example
#  include ::exim
#
class exim (
  Optional[String] $acl_not_smtp,
  Optional[String] $acl_smtp_auth,
  Optional[String] $acl_smtp_data,
  Optional[String] $acl_smtp_mail,
  Optional[String] $acl_smtp_mime,
  Optional[String] $acl_smtp_rcpt,
  Optional[Boolean] $allow_mx_to_ip,
  Optional[String] $auto_thaw,
  Optional[String] $av_scanner,
  Optional[String] $callout_domain_positive_expire,
  Optional[String] $check_spool_space,
  Optional[Array[String]] $chunking_advertise_hosts,
  Optional[Array[String]] $queue_smtp_domains,
  String $config_path,
  Optional[Array[Integer]] $daemon_smtp_ports,
  Optional[Boolean] $defaults,
  Optional[Array[String]] $delay_warning,
  Optional[Integer] $deliver_queue_load_max,
  Optional[Boolean] $disable_ipv6,
  Optional[String] $errors_reply_to,
  Optional[Boolean] $extract_addresses_remove_arguments,
  Optional[String] $freeze_tell,
  Optional[Boolean] $gnutls_compat_mode,
  Optional[String] $openssl_options,
  Optional[Boolean] $heavy,
  Optional[String] $helo_allow_chars,
  Optional[String] $host_lookup,
  Optional[Array[String]] $hosts_treat_as_local,
  Optional[String] $ignore_bounce_errors_after,
  Optional[Array] $includes,
  Optional[Array[String]] $ldap_default_servers,
  Optional[Boolean] $local_from_check,
  Optional[Array[String]] $local_interfaces,
  Optional[Array[String]] $log_file_path,
  Optional[Boolean] $log_lost_incoming_connection,
  Optional[Boolean] $log_retry_defer,
  Optional[Boolean] $log_sender_on_delivery,
  Optional[Boolean] $log_skip_delivery,
  Optional[Boolean] $log_smtp_confirmation,
  Optional[Boolean] $log_smtp_connection,
  Optional[Boolean] $log_smtp_protocol_error,
  Optional[Boolean] $log_smtp_syntax_error,
  Optional[Boolean] $log_tls_peerdn,
  Optional[Boolean] $log_mail_subject,
  Optional[Boolean] $log_8bitmime,
  Optional[Boolean] $log_acl_warn_skipped,
  Optional[Boolean] $log_address_rewrite,
  Optional[Boolean] $log_all_parents,
  Optional[Boolean] $log_arguments,
  Optional[Boolean] $log_connection_reject,
  Optional[Boolean] $log_delay_delivery,
  Optional[Boolean] $log_deliver_time,
  Optional[Boolean] $log_delivery_size,
  Optional[Boolean] $log_dnslist_defer,
  Optional[Boolean] $log_dnssec,
  Optional[Boolean] $log_etrn,
  Optional[Boolean] $log_host_lookup_failed,
  Optional[Boolean] $log_ident_timeout,
  Optional[Boolean] $log_incoming_interface,
  Optional[Boolean] $log_incoming_port,
  Optional[Boolean] $log_millisec,
  Optional[Boolean] $log_outgoing_interface,
  Optional[Boolean] $log_outgoing_port,
  Optional[Boolean] $log_queue_run,
  Optional[Boolean] $log_queue_time,
  Optional[Boolean] $log_queue_time_overall,
  Optional[Boolean] $log_pid,
  Optional[Boolean] $log_proxy,
  Optional[Boolean] $log_received_recipients,
  Optional[Boolean] $log_received_sender,
  Optional[Boolean] $log_rejected_header,
  Optional[Boolean] $log_return_path_on_delivery,
  Optional[Boolean] $log_sender_verify_fail,
  Optional[Boolean] $log_size_reject,
  Optional[Boolean] $log_smtp_incomplete_transaction,
  Optional[Boolean] $log_smtp_mailauth,
  Optional[Boolean] $log_smtp_no_mail,
  Optional[Boolean] $log_timezone,
  Optional[Boolean] $log_tls_certificate_verified,
  Optional[Boolean] $log_tls_cipher,
  Optional[Boolean] $log_tls_sni,
  Optional[Boolean] $log_unknown_in_list,
  Optional[Hash] $macros,
  Boolean $manage_service,
  Optional[Boolean] $message_logs,
  Optional[String] $message_size_limit,
  Optional[Array[String]] $never_users,
  Optional[Boolean] $untrusted_set_sender,
  Optional[Boolean] $print_topbitchars,
  Optional[String] $tls_require_ciphers,
  Optional[String] $qualify_domain,
  Optional[Integer] $queue_only_load,
  Optional[Integer] $queue_run_max,
  Optional[Integer] $remote_max_parallel,
  Optional[String] $rfc1413_hosts,
  Optional[String] $rfc1413_query_timeout,
  Optional[Integer] $smtp_accept_max,
  Optional[Integer] $smtp_accept_max_nonmail,
  Optional[Integer] $smtp_accept_max_per_connection,
  Optional[Integer] $smtp_accept_max_per_host,
  Optional[Integer] $smtp_accept_queue,
  Optional[Integer] $smtp_accept_queue_per_connection,
  Optional[Integer] $smtp_accept_reserve,
  Optional[String] $smtp_banner,
  Optional[Array[String]] $smtp_reserve_hosts,
  Optional[String] $spamd_address,
  Optional[Boolean] $split_spool_directory,
  Optional[Boolean] $syslog_timestamp,
  Optional[String] $system_filter,
  Optional[String] $timeout_frozen_after,
  Optional[Array[String]] $tls_advertise_hosts,
  Optional[String] $tls_certificate,
  Optional[String] $tls_privatekey,
  Optional[Array[String]] $trusted_users,
  Optional[String] $exim_light_package,
  Optional[String] $exim_heavy_package,
  Optional[String] $exim_service,
) {

  include ::exim::install
  include ::exim::config
  include ::exim::service

  Class['exim::install']
  -> Class['exim::config']
  ~> Class['exim::service']
}
