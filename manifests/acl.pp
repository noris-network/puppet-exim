# @summary This define creates a new acl
#
# @see  http://www.exim.org/exim-html-current/doc/html/spec_html/ch-access_control_lists.html
#
# @param acl_id
#   Id of this acl, this is needed for acl statements to reference
#   this acl.
#
define exim::acl ($acl_id=undef,$statements=undef){
  include exim

  if $statements {
    concat::fragment { "acl-${title}":
      target  => $::exim::config_path,
      content => template("${module_name}/acl/acl.erb"),
      order   => 1001,
    }
  }
  elsif $acl_id {
    concat::fragment { "acl-${acl_id}":
      target  => $::exim::config_path,
      content => template("${module_name}/acl/acl.erb"),
      order   => $acl_id * 100 + 1000,
    }
  }
  else {
    fail('you must specify "$statements" or "$acl_id"')
  }
}
