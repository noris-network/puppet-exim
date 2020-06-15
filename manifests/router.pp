# @summary
#   This module configures a single router in exims configuration
#
# @param disable
#   If set to true, this router is excluded from the configuration.
#
# @param order
#   Order of routers is important, set it here
#
# @param address_data
#   Set the address_data variable
#
# @param caseful_local_part
#   Sets the caseful_local_part option.
#
# @param retry_use_local_part
#   Sets the retry_use_local_part option.
#
# @param comment
#   Comment a router, this will be placed as a comment just above
#   the router.
#
# @param driver
#   Sets the type of router.
#
# @param allow_defer
#   If set to true, the router can defer messages if needed.
#
# @param allow_fail
#   If set to true, the router can fail messages if needed.
#
# @param allow_filter
#   If set to true, filters can be used.
#
# @param condition
#   (Advanced) Conditions when this router should be used
#
# @param data
#   Data source for the rewrite router
#
# @param debug_print
#   Used to print debug information
#
# @param domains
#   Domains for which this router should be used.
#
# @param file_transport
#   Set the file_transport, used if the outcome of the router points to a file
#
# @param file
#   Set the file that contains the filter rules.
#
# @param headers_add
#   Add these Headers to a message
#
# @param headers_remove
#   Remove these Headers to a message
#
# @param host_find_failed
#   Relevant to the manualroute router, it determines what shoud
#   happen if the used host can't be resolved to an IP address.
#
# @param ignore_target_hosts
#   remove this host from hostlists gererated by this router
#
# @param local_parts
#   The router is run only if the local part of the address matches the list.
#
# @param local_part_prefix
#   Define a prefix, present on localparts
#
# @param local_part_suffix
#   Define a suffix, present on localparts
#
# @param local_part_prefix_optional
#   Is the prefix optional?
#
# @param local_part_suffix_optional
#   Is the suffix optional?
#
# @param no_address_test
#   Skip this router in address testing mode (exim -bt)
#
# @param no_more
#   If conditions are met for this router, but the router can't process
#   this mail, the address fails instead of handeld down to the next router.
#
# @param no_verify
#   Skip this router when verifying addresses.
#
# @param pipe_transport
#   Set the pipe_transport, used if the outcome of the router points to a pipe
#
# @param qualify_preserve_domain
#   For redirect routers
#   If an unqualified address (one without a domain) is generated, it is qualified with the domain of the parent address.
#
# @param route_data
#   If this option is set, it must expand to yield the data part of a routing rule.
#
# @param route_list
#   Target server used by manualroute router.
#
# @param same_domain_copy_routing
#   This option copys routing information to all mails targeting the same domain.
#
# @param self
#   The self option specifies what happens when the first host on the list turns out to be the local host.
#   See official documentation for more details.
#
# @param senders
#   If this option is set, the router is skipped unless the message’s sender address matches something on the list.
#
# @param transport
#   Which transport should be used to send mails.
#
# @param unseen
#   When this option is set true, routing does not cease if the router accepts the address.
#
# @param user
#   When a router queues an address for a transport, and the transport does not specify a user,
#   the user given here is used when running the delivery process.
#
# @param errors_to
#   override the destination of a generated bounce message
#
# @param cannot_route_message
#   specify a text message which is used when an address can not be routed because of no more routers to try. Default
#   message is "Unroutable address"
#
# @param require_files
#   dont run this router if specified files does not exist
#
define exim::router (
  String $driver,
  Optional[Integer] $order            = 0,
  Optional[String] $address_data                       = undef,
  Optional[Boolean] $allow_defer                = false,
  Optional[Boolean] $allow_fail                 = false,
  Optional[Boolean] $allow_filter               = false,
  Optional[Boolean] $caseful_local_part                 = undef,
  Optional[Boolean] $retry_use_local_part                 = undef,
  Optional[Array[String]] $comment                            = undef,
  Optional[String] $condition                          = undef,
  Optional[String] $data                               = undef,
  Optional[String] $debug_print                        = undef,
  Optional[Boolean] $disable                    = false,
  Optional[Array[String]] $domains                            = undef,
  Optional[String] $file                               = undef,
  Optional[String] $file_transport                     = undef,
  Optional[Array[String]] $headers_add                        = undef,
  Optional[Array[String]] $headers_remove                     = undef,
  Optional[String] $host_find_failed                   = undef,
  Optional[Array[String]] $ignore_target_hosts                = undef,
  Optional[String] $local_part_prefix                  = undef,
  Optional[Boolean] $local_part_prefix_optional = false,
  Optional[Boolean] $local_part_suffix_optional = false,
  Optional[String] $local_part_suffix                  = undef,
  Optional[Array[String]] $local_parts                        = undef,
  Optional[Boolean] $no_address_test            = false,
  Optional[Boolean] $no_more                    = false,
  Optional[Boolean] $no_verify                  = false,
  Optional[String] $pipe_transport                     = undef,
  Optional[Boolean] $qualify_preserve_domain    = false,
  Optional[String] $route_data                         = undef,
  Optional[String] $route_list                         = undef,
  Optional[Boolean] $same_domain_copy_routing           = undef,
  Optional[String] $self                               = undef,
  Optional[Array[String]] $senders                            = undef,
  Optional[String] $transport                          = undef,
  Optional[Boolean] $unseen                     = false,
  Optional[String] $user                               = undef,
  Optional[String] $errors_to                  = undef,
  Optional[String] $cannot_route_message       = undef,
  Optional[Array[String]] $require_files              = undef,
  ) {

  include exim

  unless $disable {
    concat::fragment { "router-${title}":
      target  => $::exim::config_path,
      content => template("${module_name}/router/router.erb"),
      order   => $order + 2000,
    }
  }
}
