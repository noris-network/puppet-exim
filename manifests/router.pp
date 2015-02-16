define exim::router (
  $allow_defer              = false,
  $allow_fail               = false,
  $condition                = undef,
  $data                     = undef,
  $domains                  = undef,
  $driver,
  $host_find_failed         = undef,
  $no_address_test          = false,
  $no_more                  = false,
  $no_verify                = false,
  $order,
  $route_list               = undef,
  $same_domain_copy_routing = undef,
  $transport                = undef,
  ){
  concat::fragment { "router-${title}":
    target  => $::exim::config_path,
    content => template("${module_name}/router/router.erb"),
    order   => $order + 2000,
  }
}
