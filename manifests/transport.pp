define exim::transport (
  $driver,
  $connect_timeout=undef,
  ){
  concat::fragment { "transport-${title}":
    target  => $::exim::config_path,
    content => template("${module_name}/transport/transport.erb"),
    order   => 3001,
  }
}
