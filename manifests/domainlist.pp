# == Define: exim::domainlist
#
# This define can be used to create domainlists, which can be referenced later
#   http://www.exim.org/exim-html-current/doc/html/spec_html/ch-domain_host_address_and_local_part_lists.html
#
# === Parameters
#
# [*domains*]
#   Array containing a list of domains
#

define exim::domainlist (
  $domains=undef,
  ){
  $list = $domains
  concat::fragment { "domainlist-${title}":
    target  => $::exim::config_path,
    content => template("${module_name}/list.erb"),
    order   => 0002,
  }
}
