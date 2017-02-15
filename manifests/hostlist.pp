# == Define: exim::hostlist
#
# This define can be used to create hostlists, which can be referenced later
#   http://www.exim.org/exim-html-current/doc/html/spec_html/ch-domain_host_address_and_local_part_lists.html
#
# === Parameters
#
# [*hosts*]
#   Array containing a list of hosts
#

define exim::hostlist (
  $hosts=undef,
  ){
  $list     = $hosts
  $listtype = 'hostlist'
  concat::fragment { "hostlist-${title}":
    target  => $::exim::config_path,
    content => template("${module_name}/list.erb"),
    order   => '0003',
  }
}
