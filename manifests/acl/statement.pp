# == Define: exim::acl::statement
#
# This define creates one acl statement in exims configuration
#   http://www.exim.org/exim-html-current/doc/html/spec_html/ch-access_control_lists.html
#
# === Parameters
#
# [*acl_id*]
#   Id of parent acl this statement correspondes to.
#   The acl-statement is part of the acl with id "acl_id".
#
# [*order*]
#   Position of this statement in the acl (acl_id).
#
# [*action*]
#   The outcome of given acl statement (e.g.: accept)
#
# [*conditions*]
#   Conditions to "action"
#   Example:
#     [
#       ['hosts',   ['192.168.1.2','192.168.1.3']],
#       ['domains', ['+domainlist']],
#     ],
#
# [*disable*]
#  This option can be used to ignore this acl statement
#  even if other options are set.
#  This is usefull if statements are created via
#  hiera_hash with deep_merge, and you want to
#  completly disable a statement defined in a lower
#  hierachy.
#
define exim::acl::statement (
  $acl_id,
  $order,
  $action,
  $conditions      = undef,
  Boolean $disable = false
){
  unless $disable {
    notice('using exim::acl::statement is depricated please use the statements parameter of exim::acl')
    concat::fragment { "acl-${acl_id}-${order}":
      target  => $::exim::config_path,
      content => template("${module_name}/acl/statement.erb"),
      order   => $acl_id * 100 + 1000 + $order,
    }
  }
}
