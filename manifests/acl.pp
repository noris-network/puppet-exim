# == Define: exim::acl
#
# This define creates a new acl
#   http://www.exim.org/exim-html-current/doc/html/spec_html/ch-access_control_lists.html
#
# === Parameters
#
# [*acl_id*]
#   Id of this acl, this is needed for acl statements to reference 
#   this acl.
#
define exim::acl ($acl_id){
  concat::fragment { "acl-${acl_id}":
    target  => $::exim::config_path,
    content => template("${module_name}/acl/acl.erb"),
    order   => $acl_id * 100 + 1000,
  }
}
