# @summary
#   This define is used to build rewrite rules
#
# @param order
#   Determines the order, in which retry statements are evaluated
#
# @param pattern
#   Matches those addresses that are to be rewriten by rule
#
# @param replacement
#   the replacement string for matching pattern
#
# @param flags
#   The flags are single characters which indicates the address location
#   to which the rule applies and how the rewriting takes place
#
define exim::rewrite (
  String $pattern,
  String $replacement,
  Array[Enum['E','F','T','b','c','f','h','r','s','t','Q','q','R','w','S']] $flags,
  Integer $order=1,
  ){
  concat::fragment { "rewrite-${title}":
    target  => $::exim::config_path,
    content => template("${module_name}/rewrite/rewrite.erb"),
    order   => $order + 6000,
  }
}
