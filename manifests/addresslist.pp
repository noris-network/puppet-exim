#
# @summary
#   This define can be used to create addresslists, which can be referenced later
# @see
#   http://www.exim.org/exim-html-current/doc/html/spec_html/ch-domain_host_address_and_local_part_lists.html
#
# @param addresses
#   Array containing a list of hosts
#
define exim::addresslist (

  Array[String] $addresses,
) {
  include exim

  $list     = $addresses
  $listtype = 'addresslist'
  concat::fragment { "addresslist-${title}":
    target  => $exim::config_path,
    content => template("${module_name}/list.erb"),
    order   => '0003',
  }
}
