# @summary This define is used to build retry rules
#
# @param order
#   Determines the order, in which retry statements are evaluated
#
# @param error
#   Determines on which errors the rule should apply
#
# @param retries
#   Timing information for retries
#   Type: hash of hashes
#
define exim::retry (
  $domain=$title,
  $order=1,
  $error='*',
  $retries=[['F','4h','5m'],['G','16h','1h','1.5'],['F','4d','6h']]
  ){

  include exim

  concat::fragment { "retry-${title}":
    target  => $::exim::config_path,
    content => template("${module_name}/retry/retry.erb"),
    order   => $order + 4000,
  }
}
