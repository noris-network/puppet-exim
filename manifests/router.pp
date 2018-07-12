# == Define: exim::router
#
# This module configures a single router in exims configuration
#
# === Parameters
#
# [*disable*]
#  If set to true, this router is excluded from the configuration.
#
# [*order*]
#  Order of routers is important, set it here
#
# [*address_data*]
#  Set the address_data variable
#
# [*caseful_local_part*]
#  Sets the caseful_local_part option.
#
# [*comment*]
#  Comment a router, this will be placed as a comment just above
#  the router.
#
# [*driver*]
#  Sets the type of router.
#
# [*allow_defer*]
#  If set to true, the router can defer messages if needed.
#
# [*allow_fail*]
#  If set to true, the router can fail messages if needed.
#
# [*allow_filter*]
#  If set to true, filters can be used.
#
# [*condition*]
#  (Advanced) Conditions when this router should be used
#
# [*data*]
#  Data source for the rewrite router
#
# [*debug_print*]
#  Used to print debug information
#
# [*domains*]
#  Domains for which this router should be used.
#
# [*file_transport*]
#  Set the file_transport, used if the outcome of the router points to a file
#
# [*file*]
#  Set the file that contains the filter rules.
#
# [*headers_add*]
#  Add these Headers to a message
#
# [*host_find_failed*]
#  Relevant to the manualroute router, it determines what shoud
#  happen if the used host can't be resolved to an IP address.
#
# [*ignore_target_hosts*]
#  remove this host from hostlists gererated by this router
#
# [*local_parts*]
#  The router is run only if the local part of the address matches the list.
#
# [*local_part_prefix*]
#  Define a prefix, present on localparts
#
# [*local_part_suffix*]
#  Define a suffix, present on localparts
#
# [*local_part_prefix_optional*]
#  Is the prefix optional?
#
# [*local_part_suffix_optional*]
#  Is the suffix optional?
#
# [*no_address_test*]
#  Skip this router in address testing mode (exim -bt)
#
# [*no_more*]
#  If conditions are met for this router, but the router can't process
#  this mail, the address fails instead of handeld down to the next router.
#
# [*no_verify*]
#  Skip this router when verifying addresses.
#
# [*pipe_transport*]
#  Set the pipe_transport, used if the outcome of the router points to a pipe
#
# [*qualify_preserve_domain*]
#  For redirect routers
#  If an unqualified address (one without a domain) is generated, it is qualified with the domain of the parent address.
#
# [*route_data*]
#  If this option is set, it must expand to yield the data part of a routing rule.
#
# [*route_list*]
#  Target server used by manualroute router.
#
# [*same_domain_copy_routing*]
#  This option copys routing information to all mails targeting the same domain.
#
# [*self*]
#  The self option specifies what happens when the first host on the list turns out to be the local host.
#  See official documentation for more details.
#
# [*senders*]
#  If this option is set, the router is skipped unless the message’s sender address matches something on the list.
#
# [*transport*]
#  Which transport should be used to send mails.
#
# [*unseen*]
#  When this option is set true, routing does not cease if the router accepts the address.
#
# [*user*]
#  When a router queues an address for a transport, and the transport does not specify a user, the user given here is used when running the delivery process.
#
# [*errors_to*]
# override the destination of a generated bounce message
#
# [*cannot_route_message*]
# specify a text message which is used when an address can not be routed because of no more routers to try. Default 
# message is "Unroutable address"
#
define exim::router (
  $driver,
  $order,
  $address_data               = undef,
  $allow_defer                = false,
  $allow_fail                 = false,
  $allow_filter               = false,
  $caseful_local_part         = undef,
  $comment                    = undef,
  $condition                  = undef,
  $data                       = undef,
  $debug_print                = undef,
  $disable                    = false,
  $domains                    = undef,
  $file                       = undef,
  $file_transport             = undef,
  $headers_add                = undef,
  $headers_remove             = undef,
  $host_find_failed           = undef,
  $ignore_target_hosts        = undef,
  $local_part_prefix          = undef,
  $local_part_prefix_optional = false,
  $local_part_suffix_optional = false,
  $local_part_suffix          = undef,
  $local_parts                = undef,
  $no_address_test            = false,
  $no_more                    = false,
  $no_verify                  = false,
  $pipe_transport             = undef,
  $qualify_preserve_domain    = false,
  $route_data                 = undef,
  $route_list                 = undef,
  $same_domain_copy_routing   = undef,
  $self                       = undef,
  $senders                    = undef,
  $transport                  = undef,
  $unseen                     = false,
  $user                       = undef,
  $errors_to                  = undef,
  $cannot_route_message       = undef,
  ){
  unless $disable {
    validate_bool($local_part_prefix_optional, $local_part_suffix_optional)
    concat::fragment { "router-${title}":
      target  => $::exim::config_path,
      content => template("${module_name}/router/router.erb"),
      order   => $order + 2000,
    }
  }
}
