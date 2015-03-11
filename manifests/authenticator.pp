# == Define: exim::authenticator
#
# This module configures a single authenticator in exims configuration
#
# === Parameters
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
  $driver,
  $public_name,
  $server_condition,
  $server_set_id,
  $server_prompts = undef,
  ){
  concat::fragment { "authenticator-${title}":
    target  => $::exim::config_path,
    content => template("${module_name}/authenticator/authenticator.erb"),
    order   => 5001,
  }
}
