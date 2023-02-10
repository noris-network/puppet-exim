# @summary
#   This define can be used to create domainlists, which can be referenced later
#
# @see http://www.exim.org/exim-html-current/doc/html/spec_html/ch-domain_host_address_and_local_part_lists.html
#
# @param domains
#   Array containing a list of domains
#
# @param path
#   If path is set, domains are listed in a file located in this path, the main config will recieve
#   a reference to this file.
#   If path is not set, domains are written directly into the config file instead.
#
define exim::domainlist (
  Array[String] $domains,
  Optional[String] $path = undef,
) {
  include exim

  $listtype = 'domainlist'

  if $path {
    $listfile = $domains
    file { $path:
      content => template("${module_name}/listfile.erb"),
    }
    $list = [$path]
  }

  else {
    $list = $domains
  }

  concat::fragment { "domainlist-${title}":
    target  => $exim::config_path,
    content => template("${module_name}/list.erb"),
    order   => '0002',
  }
}
