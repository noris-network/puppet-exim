# @summary This module configures a single authenticator in exims configuration
#
# @param client_name
#   This string is expanded, and the result used as the user name data 
#   when computing the response to the server’s challenge. 
# @param client_secret
#   This option must be set for the authenticator to work as a client.
#   Its value is expanded and the result used as the secret string when
#   computing the response.
#
# @param client_send
#  Array of authentication data strings. The first string is send with
#  the AUTH command. The remaining ones are send in response to prompts
#  from the server. Circumflex characters ('^') are converted to binary
#  zero bytes ('\0') by Exim.
#
# @param driver
#  driver to use for the authenticator
#
# @param public_name
#  How to anounce the authenticator to the outside (PLAIN/LOGIN)
#
# @param server_secret
#  For use with cram_md5, server_secret is expanded
#  to obtain the password for that user.
#
# @param server_condition
#  The authentication check
#
# @param server_set_id
#  Set the $authenticated_id variable for later use
#
# @param server_prompts
#  Promt used in the smtp session to ask for data  (User: Password:)
#
define exim::authenticator (
  $driver,
  $public_name,
  $client_name      = undef,
  $client_secret    = undef,
  $client_send      = undef,
  $server_secret    = undef,
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
