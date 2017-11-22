# == Define: exim::authenticator
#
# This module configures a single authenticator in exims configuration
#
# === Parameters
#
# [*client_send*]
#  Array of authentication data strings. The first string is send with
#  the AUTH command. The remaining ones are send in response to prompts
#  from the server. Circumflex characters ('^') are converted to binary
#  zero bytes ('\0') by Exim.
#
# [*driver*]
#  driver to use for the authenticator
#
# [*public_name*]
#  How to anounce the authenticator to the outside (PLAIN/LOGIN)
#
# [*server_condition*]
#  The authentication check
#
# [*server_set_id*]
#  Set the $authenticated_id variable for later use
#
# [*server_prompts*]
#  Promt used in the smtp session to ask for data  (User: Password:)
#

define exim::authenticator (
  $client_send      = undef,
  $driver,
  $public_name,
  $server_condition = undef,
  $server_set_id    = undef,
  $server_prompts   = undef,
  ){
  concat::fragment { "authenticator-${title}":
    target  => $::exim::config_path,
    content => template("${module_name}/authenticator/authenticator.erb"),
    order   => 5001,
  }
}
